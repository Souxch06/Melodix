import * as React from 'react';
import { Alert, Pressable, Text, View } from 'react-native';

import { Image } from 'expo-image';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import * as Icons from '@expo/vector-icons';

import { LibraryRelated } from './LibraryRelated';

import { useUserData } from '@context';
import { HEADER_CATEGORIES_HEIGHT, HEADER_HEIGHT, Pages } from '@config';
import { translations } from '@data';
import { clearPlayHistory } from '@services';

import { styles } from './styles';

export type HeaderPropsType = {
  tab: Pages;
};

export const Header = ({ tab }: HeaderPropsType) => {
  const { top: statusBarOffset } = useSafeAreaInsets();
  const { userData } = useUserData();

  // Menu profil local : aucune session/compte — informations sur le stockage
  // local et gestion des données de l'appareil (historique d'écoute).
  const handleProfilePress = () => {
    Alert.alert(translations.accountTitle, translations.accountLocalInfo, [
      { text: translations.accountCancel, style: 'cancel' },
      {
        text: translations.accountClearHistory,
        style: 'destructive',
        onPress: () => {
          clearPlayHistory()
            .then(() =>
              Alert.alert(
                translations.accountTitle,
                translations.accountHistoryCleared
              )
            )
            .catch(() => undefined);
        },
      },
    ]);
  };

  const title = React.useMemo(() => translations.header[tab], [tab]);

  const height = React.useMemo(() => {
    switch (tab) {
      case Pages.LIBRARY:
        return HEADER_HEIGHT + HEADER_CATEGORIES_HEIGHT;
      case Pages.SEARCH:
        /* return search box height */
        return HEADER_HEIGHT + 0;
      case Pages.HOME:
      default:
        return HEADER_HEIGHT;
    }
  }, [tab]);

  const TabRelatedComponent = React.useMemo(() => {
    switch (tab) {
      case Pages.LIBRARY:
        return <LibraryRelated />;
      case Pages.SEARCH:
        return <>{/* Render search box */}</>;
      case Pages.HOME:
      default:
        return null;
    }
  }, [tab]);

  const TabRelatedIcons = React.useMemo(() => {
    switch (tab) {
      case Pages.LIBRARY:
        return (
          <>
            <Pressable>
              <Icons.Ionicons style={styles.icon} name="search" />
            </Pressable>
            <Pressable>
              <Icons.AntDesign style={styles.icon} name="plus" />
            </Pressable>
          </>
        );
      case Pages.SEARCH:
        return <>{/* Render search related icons */}</>;
      case Pages.HOME:
      default:
        return null;
    }
  }, [tab]);

  return (
    <View style={[styles.container, { paddingTop: statusBarOffset, height }]}>
      <View style={styles.content}>
        <Pressable
          style={styles.profile}
          onPress={handleProfilePress}
          accessibilityRole="button"
          accessibilityLabel={translations.accountTitle}
        >
          {userData.imageURL ? (
            <Image
              style={styles.profileImage}
              source={{ uri: userData.imageURL }}
            />
          ) : (
            <View style={styles.profileFallback}>
              {userData.displayName ? (
                <Text style={styles.profileInitial}>
                  {userData.displayName.charAt(0).toUpperCase()}
                </Text>
              ) : (
                <Icons.Ionicons name="person" style={styles.profileIcon} />
              )}
            </View>
          )}
        </Pressable>
        {title && <Text style={styles.titleText}>{title}</Text>}
        {TabRelatedIcons}
      </View>
      {TabRelatedComponent}
    </View>
  );
};
