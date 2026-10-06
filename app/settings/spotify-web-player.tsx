import * as React from 'react';
import {
  Pressable,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  View,
} from 'react-native';
import { useRouter } from 'expo-router';
import Ionicons from '@expo/vector-icons/Ionicons';

import { COLORS } from '@config';
import { usePreferences, useAccent } from '@context';
import {
  getSpotifyWebPhysicalValidation,
  getSpotifyWebPhysicalValidationEvidence,
  isSpotifyWebPlaybackEnabled,
  recordSpotifyWebPhysicalValidation,
  resolveSpotifyWebIntegrationReadiness,
  resolveSpotifyWebPlaybackActivation,
  setSpotifyWebPlaybackEnabled,
  subscribeSpotifyWebPublishedState,
  subscribeSpotifyWebPlaybackActivation,
} from '@services';
import { SettingsSwitch } from '../../components/Settings/SettingsSwitch';

/**
 * Réglage « Lecture Spotify Web » — et l'état HONNÊTE de la porte.
 *
 * Trois verrous, tous affichés :
 *  1. le réglage utilisateur (ce switch) ;
 *  2. le flag local en mémoire (section développeur) ;
 *  3. la validation physique consignée avec preuve (section développeur).
 * Tant que les deux verrous 2 et 3 ne sont pas levés, le switch est inactif
 * et la lecture Spotify Web est IMPOSSIBLE : la cascade Audius → YouTube
 * reste la seule voie. Rien n'est masqué, rien n'est simulé.
 */
export default function SpotifyWebPlayerSettings() {
  const router = useRouter();
  const accent = useAccent();
  const { spotifyWebPlayback, setSpotifyWebPlayback } = usePreferences();

  const [activation, setActivation] = React.useState(() =>
    resolveSpotifyWebPlaybackActivation()
  );
  const [readiness, setReadiness] = React.useState(() =>
    resolveSpotifyWebIntegrationReadiness()
  );
  const [evidence, setEvidence] = React.useState(
    () => getSpotifyWebPhysicalValidationEvidence() ?? ''
  );
  const [recordError, setRecordError] = React.useState<string | null>(null);

  // Photos vivantes : l'activation (flag/porte) et l'état publié (hôte/pont)
  // évoluent sans timer — chaque événement de bus re-rend la page.
  React.useEffect(
    () =>
      subscribeSpotifyWebPlaybackActivation(() => {
        setActivation(resolveSpotifyWebPlaybackActivation());
        setReadiness(resolveSpotifyWebIntegrationReadiness());
      }),
    []
  );
  React.useEffect(
    () =>
      subscribeSpotifyWebPublishedState(() => {
        setReadiness(resolveSpotifyWebIntegrationReadiness());
      }),
    []
  );

  const physicalValidation = getSpotifyWebPhysicalValidation();
  const flagEnabled = isSpotifyWebPlaybackEnabled();
  const gateOpen = activation.active;

  const recordPassed = () => {
    try {
      recordSpotifyWebPhysicalValidation(true, evidence);
      setRecordError(null);
    } catch (error) {
      setRecordError(
        error instanceof Error ? error.message : 'preuve documentée requise'
      );
    }
  };

  const recordNotPassed = () => {
    recordSpotifyWebPhysicalValidation(false, null);
    setEvidence('');
    setRecordError(null);
  };

  return (
    <View style={styles.screen} testID="spotify-web-settings-screen">
      <View style={styles.header}>
        <Pressable
          accessibilityLabel="Retour"
          onPress={() => router.back()}
          style={styles.iconButton}
          testID="spotify-web-settings-back"
        >
          <Ionicons color={COLORS.WHITE} name="arrow-back" size={26} />
        </Pressable>
        <Text style={styles.title}>Lecture Spotify Web</Text>
        <View style={styles.iconButton} />
      </View>

      <ScrollView contentContainerStyle={styles.content}>
        {/* ── État de la lecture ─────────────────────────────────────── */}
        <Text style={styles.sectionTitle}>Lecture</Text>
        <View style={styles.card}>
          <SettingsSwitch
            label="Lire via Spotify Web"
            subtitle={
              gateOpen
                ? 'Source prioritaire quand disponible ; bascule sur Audius puis YouTube si la lecture n’est pas réellement confirmée.'
                : 'Indisponible : la validation physique et le flag local doivent être levés (section développement ci-dessous).'
            }
            value={gateOpen && spotifyWebPlayback}
            onValueChange={(value) => {
              if (!gateOpen) return;
              setSpotifyWebPlayback(value);
            }}
            testID="spotify-web-playback"
          />
        </View>

        <View style={styles.card} testID="spotify-web-readiness">
          <Text style={styles.readinessLabel}>
            État de disponibilité :{' '}
            <Text style={{ color: readiness.ready ? accent : COLORS.WHITE }}>
              {readiness.ready ? 'prête' : 'non prête'}
            </Text>
          </Text>
          {readiness.blockers.map((blocker) => (
            <Text key={blocker} style={styles.readinessBlocker}>
              • {blocker}
            </Text>
          ))}
          <Text style={styles.readinessHint}>
            « prête » = flag local + validation physique + hôte monté + pont
            prêt. Un morceau n’est jamais déclaré lu avant confirmation réelle.
          </Text>
        </View>

        {/* ── Développement / validation ─────────────────────────────── */}
        <Text style={styles.sectionTitle}>Développement</Text>
        <View style={styles.card}>
          <SettingsSwitch
            label="Flag local (mémoire, non persisté)"
            subtitle="Premier verrou de la porte d’activation. Ne prouve aucune lecture."
            value={flagEnabled}
            onValueChange={setSpotifyWebPlaybackEnabled}
            isLast={false}
            testID="spotify-web-flag"
          />
          <SettingsSwitch
            label="Validation physique consignée"
            subtitle={
              physicalValidation === 'PASSED_ON_DEVICE'
                ? `Consignée : ${getSpotifyWebPhysicalValidationEvidence() ?? ''}`
                : 'NON TESTÉE : le test sur téléphone réel (docs/SPOTIFY-WEB-PHYSICAL-TEST.md) doit être consigné avec preuve documentée.'
            }
            value={physicalValidation === 'PASSED_ON_DEVICE'}
            onValueChange={(value) => {
              if (value) {
                // La porte exige une preuve : on ne peut pas la lever par un
                // simple switch — le champ ci-dessous porte la référence.
                recordPassed();
              } else {
                recordNotPassed();
              }
            }}
            isLast={false}
            testID="spotify-web-validation"
          />
          <View style={styles.evidenceBox}>
            <Text style={styles.evidenceLabel}>Référence de preuve</Text>
            <TextInput
              value={evidence}
              onChangeText={setEvidence}
              placeholder="ex. phone-run 2026-10-06 : lecture réelle + source media-session consignées dans docs/SPOTIFY-WEB-PHYSICAL-TEST.md"
              placeholderTextColor={COLORS.GREY}
              style={styles.evidenceInput}
              testID="spotify-web-evidence-input"
            />
            <Pressable
              onPress={recordPassed}
              style={[styles.recordButton, { backgroundColor: accent }]}
              testID="spotify-web-record-passed"
            >
              <Text style={styles.recordButtonText}>
                Consigner PASSED (preuve ci-dessus)
              </Text>
            </Pressable>
            <Pressable
              onPress={recordNotPassed}
              style={styles.recordButtonGhost}
              testID="spotify-web-record-not-passed"
            >
              <Text style={styles.recordButtonTextGhost}>
                Repasser à NOT_TESTED
              </Text>
            </Pressable>
            {recordError ? (
              <Text style={styles.recordError}>{recordError}</Text>
            ) : null}
          </View>
          <Text style={styles.cardNote}>
            La lecture Spotify Web ne s’active JAMAIS sans les deux verrous :
            c’est la règle qui empêche d’activer un chemin invérifiable.
          </Text>
        </View>

        {/* ── Diagnostic ─────────────────────────────────────────────── */}
        <Pressable
          onPress={() => router.push('/settings/spotify-web-diagnostic')}
          style={styles.diagButton}
          testID="spotify-web-open-diagnostic"
        >
          <Ionicons color={COLORS.WHITE} name="pulse" size={18} />
          <Text style={styles.diagButtonText}>
            Ouvrir le diagnostic WebView (isolé)
          </Text>
        </Pressable>
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: COLORS.NAV,
    borderRadius: 12,
    marginBottom: 8,
    paddingHorizontal: 14,
    paddingVertical: 6,
  },
  cardNote: {
    color: COLORS.GREY,
    fontSize: 11,
    marginTop: 6,
    paddingVertical: 8,
  },
  content: { padding: 16, paddingBottom: 40 },
  diagButton: {
    alignItems: 'center',
    backgroundColor: COLORS.SECONDARY,
    borderRadius: 12,
    flexDirection: 'row',
    gap: 8,
    justifyContent: 'center',
    marginTop: 8,
    paddingVertical: 14,
  },
  diagButtonText: { color: COLORS.WHITE, fontSize: 14, fontWeight: '600' },
  evidenceBox: {
    borderTopWidth: 1,
    borderTopColor: COLORS.SECONDARY,
    marginTop: 4,
    paddingTop: 10,
  },
  evidenceInput: {
    backgroundColor: COLORS.PRIMARY,
    borderColor: COLORS.GREY,
    borderRadius: 8,
    borderWidth: 1,
    color: COLORS.WHITE,
    fontSize: 12,
    minHeight: 64,
    padding: 10,
  },
  evidenceLabel: { color: COLORS.LIGHT_GREY, fontSize: 12, marginBottom: 6 },
  header: {
    alignItems: 'center',
    backgroundColor: COLORS.NAV,
    flexDirection: 'row',
    paddingHorizontal: 8,
    paddingTop: 12,
  },
  iconButton: {
    alignItems: 'center',
    height: 44,
    justifyContent: 'center',
    width: 44,
  },
  readinessBlocker: { color: COLORS.WHITE, fontSize: 12, marginTop: 4 },
  readinessHint: { color: COLORS.GREY, fontSize: 11, marginTop: 8 },
  readinessLabel: { color: COLORS.LIGHT_GREY, fontSize: 13 },
  recordButton: {
    borderRadius: 8,
    marginTop: 10,
    paddingVertical: 10,
  },
  recordButtonText: { color: COLORS.PRIMARY, fontSize: 13, fontWeight: '700' },
  recordButtonGhost: { marginTop: 8, paddingVertical: 6 },
  recordButtonTextGhost: {
    alignSelf: 'center',
    color: COLORS.GREY,
    fontSize: 12,
  },
  recordError: { color: '#ff6b6b', fontSize: 11, marginTop: 8 },
  screen: { backgroundColor: COLORS.PRIMARY, flex: 1 },
  sectionTitle: {
    color: COLORS.GREY,
    fontSize: 12,
    fontWeight: '700',
    marginBottom: 6,
    marginTop: 14,
    textTransform: 'uppercase',
  },
  title: { color: COLORS.WHITE, fontSize: 17, fontWeight: '600' },
});
