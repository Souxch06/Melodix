import * as React from 'react';
import { View } from 'react-native';
import { Tabs } from 'expo-router';

import { MiniPlayer } from '@components';
import { BottomTabBar } from '@navigators';

export default function Layout() {
  return (
    <Tabs
      tabBar={(props) => (
        <View>
          {/* Playback bar (Audius audio), renders nothing when idle. */}
          <MiniPlayer />
          <BottomTabBar {...props} />
        </View>
      )}
    >
      <Tabs.Screen name="home" options={{ headerShown: false }} />
      <Tabs.Screen name="search" options={{ headerShown: false }} />
      <Tabs.Screen name="library" options={{ headerShown: false }} />
    </Tabs>
  );
}
