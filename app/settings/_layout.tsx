import * as React from 'react';

import { Stack } from 'expo-router';

export default function SettingsLayout() {
  return (
    <Stack
      screenOptions={{ animation: 'slide_from_right', headerShown: false }}
    >
      <Stack.Screen name="index" options={{ headerShown: false }} />
      <Stack.Screen name="faq" options={{ headerShown: false }} />
      <Stack.Screen name="about" options={{ headerShown: false }} />
      {/* TEMPORAIRE (4.4.7-diagnostic) : écran « Diagnostic technique ». */}
      <Stack.Screen name="diag" options={{ headerShown: false }} />
    </Stack>
  );
}
