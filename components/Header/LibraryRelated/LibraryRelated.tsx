import * as React from 'react';
import { View } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';

import { CategoryPressable } from './CategoryPressable';

import { Categories } from '@config';
import { styles } from './styles';

export const LibraryRelated = () => (
  <ScrollView
    style={styles.scrollView}
    horizontal
    showsHorizontalScrollIndicator={false}
  >
    <View style={styles.scrollViewContainer}>
      {(
        Object.values(Categories).filter(
          (category): category is Exclude<Categories, Categories.ALL> =>
            category !== Categories.ALL
        ) as Exclude<Categories, Categories.ALL>[]
      ).map((currentCategory) => (
          <CategoryPressable
            key={currentCategory}
            currentCategory={currentCategory}
          />
        ))}
    </View>
  </ScrollView>
);
