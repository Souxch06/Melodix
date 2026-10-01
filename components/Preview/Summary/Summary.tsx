import * as React from 'react';
import { Pressable, Text, View } from 'react-native';
import { Entypo } from '@expo/vector-icons';

import { AnimatedPressable } from './AnimatedPressable';

import { checkSavedAlbums, checkSavedPlaylists } from '@api';
import { removeSavedItem, saveItem } from '@services';
import { LibraryItemModel } from '@models';

import { styles } from './styles';

export type SummaryPropsType = {
  id: string;
  type: 'album' | 'playlist';
  title: string;
  subtitle: string;
  info: string;
  imageURL?: string;
  /** Description Spotify de la playlist (affichée sous l'en-tête). */
  description?: string;
  /** Statistique dynamique « 85/100 morceaux disponibles ». */
  availabilityInfo?: string;
  forceDisableSaveIcon?: boolean;
};

export const Summary = ({
  id,
  type,
  title,
  subtitle,
  info,
  imageURL = '',
  description = '',
  availabilityInfo = '',
  forceDisableSaveIcon,
}: SummaryPropsType) => {
  const [isSaved, setIsSaved] = React.useState<boolean>(false);

  React.useEffect(() => {
    if (!id) {
      return;
    }

    (async () => {
      try {
        const checked =
          type === 'album'
            ? await checkSavedAlbums([id])
            : await checkSavedPlaylists([id]);

        setIsSaved(checked[0]);
      } catch (error) {
        setIsSaved(false);
        console.error(`Failed to check if ${type} is saved:`, error);
      }
    })();
  }, [type, id]);

  // Favori LOCAL (aucun compte) : persiste la carte complète dans la
  // bibliothèque de l'appareil, réversible.
  const handleToggleSave = React.useCallback(() => {
    if (!id || !title) {
      return;
    }

    const nextState = !isSaved;
    setIsSaved(nextState);

    (async () => {
      try {
        if (nextState) {
          const item: LibraryItemModel = {
            id,
            type,
            title,
            subtitle,
            imageURL,
          };
          await saveItem(item);
        } else {
          await removeSavedItem(type, id);
        }
      } catch (error) {
        // La persistance échoue : on revient à l'état affiché précédent.
        console.error(`Failed to persist ${type} favorite state:`, error);
        setIsSaved(!nextState);
      }
    })();
  }, [id, type, title, subtitle, imageURL, isSaved]);

  return (
    <View style={styles.summary}>
      <Text style={styles.title}>{title}</Text>
      {description ? (
        <Text numberOfLines={3} style={styles.descriptionText}>
          {description}
        </Text>
      ) : null}
      <Text style={styles.subtitle}>{subtitle}</Text>
      <Text style={styles.info}>{info}</Text>
      {availabilityInfo ? (
        <Text
          style={styles.availabilityInfo}
          testID="playlist-availability-stat"
        >
          {availabilityInfo}
        </Text>
      ) : null}

      <View style={styles.pressablesView}>
        {!forceDisableSaveIcon && (
          <AnimatedPressable
            defaultIcon="plus"
            activeIcon="check"
            isActive={isSaved}
            onPress={handleToggleSave}
          />
        )}
        <AnimatedPressable
          defaultIcon="arrow-down"
          activeIcon="arrow-down"
          // TODO: removed this true value and check if tracks are downloaded instead
          isActive={true}
        />
        <Pressable>
          <Entypo style={styles.moreIcon} name="dots-three-horizontal" />
        </Pressable>
      </View>
    </View>
  );
};
