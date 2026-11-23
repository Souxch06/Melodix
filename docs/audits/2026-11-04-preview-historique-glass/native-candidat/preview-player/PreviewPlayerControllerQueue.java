package com.melodix.music;

// User request (1022402, free account): Spotify's web player plays a tapped track alone, without its playlist.
// Melodix keeps the playlist order itself, like the Spotify app: in order or shuffled (the tapped track first),
// with repeat off / playlist / track (PreviewPlayerMode). Pure state; the controller plays the chosen track.
final class PreviewPlayerControllerQueue {
    private static final java.util.ArrayList<String> uris = new java.util.ArrayList<String>();
    private static final java.util.ArrayList<org.json.JSONObject> rowsKept = new java.util.ArrayList<org.json.JSONObject>();
    private static int[] order = new int[0];
    private static int at = -1;
    private static boolean shuffled;
    private static int added; // tracks added with "Ajouter à la file d'attente" waiting after the current one
    static java.util.Random random = new java.util.Random();

    // Tracks and podcast episodes (user request 1022409).
    static boolean playable(String u) { return u != null && u.matches("spotify:(track|episode):[A-Za-z0-9]+"); }
    static boolean isEmpty() { return at < 0 || order.length == 0; }
    static void clear() { uris.clear(); rowsKept.clear(); order = new int[0]; at = -1; added = 0; }

    static boolean start(org.json.JSONArray rows, String uri) {
        clear(); int first = -1;
        for (int i = 0; i < rows.length(); i++) {
            org.json.JSONObject o = rows.optJSONObject(i); if (o == null) continue;
            String u = o.optString("uri", ""); if (u.isEmpty()) u = o.optString("id", "");
            if (!playable(u)) continue;
            if (first < 0 && u.equals(uri)) first = uris.size();
            uris.add(u); rowsKept.add(o);
        }
        if (first < 0) { clear(); return false; }
        build(first); return true;
    }

    // In order: position on the track. Shuffled: the track first, then the rest in a random order (Spotify).
    private static void build(int first) {
        shuffled = PreviewPlayerMode.shuffleMode; int n = uris.size(); order = new int[n];
        for (int i = 0; i < n; i++) order[i] = i;
        added = 0;
        if (!shuffled) { at = first; return; }
        order[0] = first; order[first] = 0;
        for (int i = n - 1; i > 1; i--) { int j = 1 + random.nextInt(i); int x = order[i]; order[i] = order[j]; order[j] = x; }
        at = 0;
    }

    // The row of a queued track (title, artist, cover) for an instant display before Spotify reports it.
    static org.json.JSONObject row(String uri) { int i = uris.indexOf(uri); return i < 0 ? null : rowsKept.get(i); }

    static String current() { return isEmpty() ? "" : uris.get(order[at]); }

    // Shuffle toggled while playing: rebuild around the current track (Spotify keeps it and changes what follows).
    static void sync() { if (!isEmpty() && shuffled != PreviewPlayerMode.shuffleMode) build(order[at]); }

    // Next/previous track, or null at an end when not wrapping.
    static String step(boolean forward, boolean wrap) {
        if (isEmpty()) return null; sync();
        int k = at + (forward ? 1 : -1);
        if (k < 0 || k >= order.length) { if (!wrap) return null; k = forward ? 0 : order.length - 1; }
        if (forward && added > 0 && k == at + 1) added--;
        at = k; return current();
    }

    // Spotify: queued tracks play right after the current one, in the order they were added.
    static boolean addNext(String uri, org.json.JSONObject row) {
        if (isEmpty() || !playable(uri)) return false;
        uris.add(uri); rowsKept.add(row);
        int pos = Math.min(order.length, at + 1 + added), n = order.length;
        int[] o = new int[n + 1];
        for (int i = 0, j = 0; i <= n; i++) o[i] = i == pos ? uris.size() - 1 : order[j++];
        order = o; added++; return true;
    }

    // The player's queue panel (PreviewPlayerTiles, by reflection): now playing + up to 50 next, "title\tartist" lines.
    static String snapshot() {
        if (isEmpty()) return null;
        try {
            org.json.JSONObject o = new org.json.JSONObject(); StringBuilder next = new StringBuilder();
            for (int k = at + 1; k < order.length && k <= at + 50; k++) next.append(next.length() == 0 ? "" : "\n").append(line(order[k]));
            o.put("ok", true); o.put("now", line(order[at])); o.put("next", next.toString()); return o.toString();
        } catch (Exception e) { return null; }
    }
    private static String line(int i) {
        org.json.JSONObject r = rowsKept.get(i);
        return PreviewPlayerControllerPlayAll.title(r).replace('\t', ' ').replace('\n', ' ') + "\t" + PreviewPlayerControllerPlayAll.artist(r).replace('\t', ' ').replace('\n', ' ');
    }

    // Queue panel: remove the k-th upcoming track (0 = next).
    static boolean removeUpcoming(int k) {
        int pos = at + 1 + k; if (isEmpty() || k < 0 || pos >= order.length) return false;
        int[] o = new int[order.length - 1];
        for (int i = 0, j = 0; i < order.length; i++) if (i != pos) o[j++] = order[i];
        if (k < added) added--;
        order = o; return true;
    }

    // Queue panel "Lire ensuite": move the k-th upcoming track right after the current one.
    static boolean playNext(int k) {
        int pos = at + 1 + k; if (isEmpty() || k <= 0 || pos >= order.length) return false;
        int x = order[pos]; for (int i = pos; i > at + 1; i--) order[i] = order[i - 1]; order[at + 1] = x; return true;
    }

    static boolean moveTo(String uri) {
        for (int k = 0; k < order.length; k++) if (uris.get(order[k]).equals(uri)) { at = k; return true; }
        return false;
    }
}
