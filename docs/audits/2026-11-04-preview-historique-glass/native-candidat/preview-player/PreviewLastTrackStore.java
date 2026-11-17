package com.melodix.music;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Looper;
import android.util.AtomicFile;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Private, non-backed-up, one-record visual cache. Never issues player commands. */
final class PreviewLastTrackStore {
    static final long MAX_AGE = 30L * 24 * 60 * 60 * 1000;
    private static final int MAGIC = 0x4d445831, MAX_IMAGE = 512 * 1024;
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static volatile long generation;
    static final class Record {
        String title, artist, state;
        long duration, position, observed;
        byte[] image;
    }
    interface Callback { void loaded(Record record, Bitmap image); }
    private static File file(Context context) {
        try {
            File dir = context.getNoBackupFilesDir();
            return dir == null ? null : new File(dir, "preview_last_track_v1");
        } catch (RuntimeException ignored) { return null; }
    }
    static boolean valid(Record r, long now) {
        return r != null && r.title != null && r.artist != null && r.state != null &&
            !r.title.trim().isEmpty() && !r.artist.trim().isEmpty() &&
            r.title.length() <= 120 && r.artist.length() <= 120 &&
            (r.state.equals("playing") || r.state.equals("paused")) &&
            r.duration > 0 && r.duration <= 24L * 60 * 60 * 1000 &&
            r.position >= 0 && r.position <= r.duration &&
            r.observed > 0 && r.observed <= now && now - r.observed <= MAX_AGE &&
            (r.image == null || r.image.length <= MAX_IMAGE);
    }
    static Record read(File path, long now) {
        if (path == null) return null;
        try {
            AtomicFile f = new AtomicFile(path);
            DataInputStream in = new DataInputStream(f.openRead());
            try {
                if (in.readInt() != MAGIC) return null;
                Record r = new Record();
                r.title = in.readUTF(); r.artist = in.readUTF(); r.state = in.readUTF();
                r.duration = in.readLong(); r.position = in.readLong(); r.observed = in.readLong();
                int length = in.readInt();
                if (length < 0 || length > MAX_IMAGE) return null;
                r.image = new byte[length]; in.readFully(r.image);
                if (in.read() != -1 || !valid(r, now)) return null;
                return r;
            } finally { in.close(); }
        } catch (Exception ignored) { return null; }
    }
    static boolean write(File path, Record r) {
        if (path == null || !valid(r, System.currentTimeMillis())) return false;
        AtomicFile file = new AtomicFile(path); FileOutputStream out = null;
        try {
            out = file.startWrite(); DataOutputStream data = new DataOutputStream(out);
            data.writeInt(MAGIC); data.writeUTF(r.title); data.writeUTF(r.artist); data.writeUTF(r.state);
            data.writeLong(r.duration); data.writeLong(r.position); data.writeLong(r.observed);
            byte[] bytes = r.image == null ? new byte[0] : r.image;
            data.writeInt(bytes.length); data.write(bytes); data.flush(); file.finishWrite(out); return true;
        } catch (Exception ignored) { if (out != null) file.failWrite(out); return false; }
    }
    static void load(Context context, final Callback callback) {
        final File path = file(context); final long current = generation;
        IO.execute(new Runnable() { public void run() {
            final Record r = read(path, System.currentTimeMillis()); Bitmap result = null;
            if (r != null && r.image.length > 0) {
                try {
                    BitmapFactory.Options bounds = new BitmapFactory.Options(); bounds.inJustDecodeBounds = true;
                    BitmapFactory.decodeByteArray(r.image, 0, r.image.length, bounds);
                    if (bounds.outWidth > 0 && bounds.outWidth <= 384 && bounds.outHeight > 0 && bounds.outHeight <= 384)
                        result = BitmapFactory.decodeByteArray(r.image, 0, r.image.length);
                } catch (RuntimeException ignored) { }
            }
            final Bitmap image = result;
            MAIN.post(new Runnable() { public void run() { if (current == generation) callback.loaded(r, image); } });
        }});
    }
    static void save(Context context, final Record record, final Bitmap bitmap) {
        final File path = file(context); final long current = generation;
        if (path == null) return;
        IO.execute(new Runnable() { public void run() {
            if (current != generation) return;
            if (bitmap != null && !bitmap.isRecycled()) try {
                int w = bitmap.getWidth(), h = bitmap.getHeight();
                float scale = Math.min(1f, 384f / Math.max(w, h));
                Bitmap small = Bitmap.createScaledBitmap(bitmap, Math.max(1, Math.round(w*scale)), Math.max(1, Math.round(h*scale)), true);
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                if (small.compress(Bitmap.CompressFormat.JPEG, 85, out) && out.size() <= MAX_IMAGE) record.image = out.toByteArray();
                if (small != bitmap) small.recycle();
            } catch (RuntimeException ignored) { }
            if (record.image == null) {
                Record old = read(path, System.currentTimeMillis());
                if (old != null && old.title.equals(record.title) && old.artist.equals(record.artist) && old.duration == record.duration)
                    record.image = old.image;
            }
            if (current == generation) write(path, record);
        }});
    }
    static void clear(Context context) {
        final File path = file(context); generation++;
        if (path == null) return;
        // Logout must not return while an older queued write can resurrect data.
        try { IO.submit(new Runnable() { public void run() { new AtomicFile(path).delete(); }}).get(); }
        catch (Exception ignored) { }
    }
}
