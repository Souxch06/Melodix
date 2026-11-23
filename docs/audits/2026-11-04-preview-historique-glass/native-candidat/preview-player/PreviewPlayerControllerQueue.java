package com.melodix.music;

// User request (1022402, free account): Spotify's web player plays a tapped track alone, without its playlist.
// Melodix keeps the playlist order itself, like the Spotify app: in order or shuffled (the tapped track first),
// with repeat off / playlist / track (PreviewPlayerMode). Pure state; the controller plays the chosen track.
final class PreviewPlayerControllerQueue {
    private static final java.util.ArrayList<String> uris = new java.util.ArrayList<String>();
    private static int[] order = new int[0];
    private static int at = -1;
    private static boolean shuffled;
    static java.util.Random random = new java.util.Random();

    static boolean isEmpty() { return at < 0 || order.length == 0; }
    static void clear() { uris.clear(); order = new int[0]; at = -1; }

    static boolean start(org.json.JSONArray rows, String uri) {
        clear(); int first = -1;
        for (int i = 0; i < rows.length(); i++) {
            org.json.JSONObject o = rows.optJSONObject(i); if (o == null) continue;
            String u = o.optString("uri", ""); if (u.isEmpty()) u = o.optString("id", "");
            if (!u.startsWith("spotify:track:")) continue;
            if (first < 0 && u.equals(uri)) first = uris.size();
            uris.add(u);
        }
        if (first < 0) { clear(); return false; }
        build(first); return true;
    }

    // In order: position on the track. Shuffled: the track first, then the rest in a random order (Spotify).
    private static void build(int first) {
        shuffled = PreviewPlayerMode.shuffleMode; int n = uris.size(); order = new int[n];
        for (int i = 0; i < n; i++) order[i] = i;
        if (!shuffled) { at = first; return; }
        order[0] = first; order[first] = 0;
        for (int i = n - 1; i > 1; i--) { int j = 1 + random.nextInt(i); int x = order[i]; order[i] = order[j]; order[j] = x; }
        at = 0;
    }

    static String current() { return isEmpty() ? "" : uris.get(order[at]); }

    // Shuffle toggled while playing: rebuild around the current track (Spotify keeps it and changes what follows).
    static void sync() { if (!isEmpty() && shuffled != PreviewPlayerMode.shuffleMode) build(order[at]); }

    // Next/previous track, or null at an end when not wrapping.
    static String step(boolean forward, boolean wrap) {
        if (isEmpty()) return null; sync();
        int k = at + (forward ? 1 : -1);
        if (k < 0 || k >= order.length) { if (!wrap) return null; k = forward ? 0 : order.length - 1; }
        at = k; return current();
    }

    static boolean moveTo(String uri) {
        for (int k = 0; k < order.length; k++) if (uris.get(order[k]).equals(uri)) { at = k; return true; }
        return false;
    }
}
