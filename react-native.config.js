// Modules natifs présents dans package.json mais inutilisés par l'application :
// ils sont exclus de la compilation native pour alléger l'APK et accélérer le build.
module.exports = {
  dependencies: {
    '@shopify/react-native-skia': { platforms: { android: null, ios: null } },
    'react-native-dominant-color': { platforms: { android: null, ios: null } },
  },
};
