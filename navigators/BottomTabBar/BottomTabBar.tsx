import * as React from 'react';
import { Pressable, Text, View } from 'react-native';

import { BlurView } from 'expo-blur';
import AntDesign from '@expo/vector-icons/AntDesign';
import Ionicons from '@expo/vector-icons/Ionicons';
import { useSafeAreaInsets } from 'react-native-safe-area-context';

import { Pages } from '@config';
import { translations } from '@data';

import { styles } from './styles';
import { BottomTabBarProps } from '@react-navigation/bottom-tabs';
import { useApplicationDimensions } from '@hooks';

const renderPressableContent = (name: string, isActive: boolean) => {
  switch (name) {
    case Pages.SEARCH:
      return (
        <View style={styles.linkContainer}>
          <Ionicons
            style={[styles.icon, isActive ? styles.activeIcon : {}]}
            name="search"
            size={22}
          />
          <Text style={[styles.text, isActive ? styles.active : {}]}>
            {translations.router[Pages.SEARCH]}
          </Text>
          <View style={isActive ? styles.activeDot : styles.inactiveDot} />
        </View>
      );
    case Pages.LIBRARY:
      return (
        <View style={styles.linkContainer}>
          <Ionicons
            style={[styles.icon, isActive ? styles.activeIcon : {}]}
            name="library"
            size={22}
          />
          <Text style={[styles.text, isActive ? styles.active : {}]}>
            {translations.router[Pages.LIBRARY]}
          </Text>
          <View style={isActive ? styles.activeDot : styles.inactiveDot} />
        </View>
      );
    default:
      return (
        <View style={styles.linkContainer}>
          <AntDesign
            style={[styles.icon, isActive ? styles.activeIcon : {}]}
            name="home"
            size={22}
          />
          <Text style={[styles.text, isActive ? styles.active : {}]}>
            {translations.router[Pages.HOME]}
          </Text>
          <View style={isActive ? styles.activeDot : styles.inactiveDot} />
        </View>
      );
  }
};

export const BottomTabBar = ({
  state,
  descriptors,
  navigation,
}: BottomTabBarProps) => {
  const { width } = useApplicationDimensions();
  const { bottom: gestureInset } = useSafeAreaInsets();

  return (
    <View
      style={[
        styles.container,
        { paddingBottom: Math.max(gestureInset, 8) },
      ]}
    >
      {/* Barre translucide : flou système + voile sombre + liseré supérieur. */}
      <BlurView intensity={40} style={styles.blurBackdrop} tint="dark" />
      <View style={styles.tintVeil} />
      <View style={styles.topHairline} />
      {state.routes.map((route, index) => {
        const { options } = descriptors[route.key];
        const isActive = state.index === index;

        const onPress = () => {
          const event = navigation.emit({
            type: 'tabPress',
            target: route.key,
            canPreventDefault: true,
          });

          if (!isActive && !event.defaultPrevented) {
            navigation.navigate(route.name);
          }
        };

        return (
          <Pressable
            key={index}
            accessibilityRole="button"
            accessibilityState={isActive ? { selected: true } : {}}
            accessibilityLabel={options.tabBarAccessibilityLabel}
            onPress={onPress}
            style={[styles.pressable, { width: width / 3 }]}
          >
            {renderPressableContent(route.name, isActive)}
          </Pressable>
        );
      })}
    </View>
  );
};
