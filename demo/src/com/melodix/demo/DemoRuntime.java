package com.melodix.demo;

import android.app.Application;
import android.os.Build;
import java.io.FileInputStream;

/** Preview-only process discriminator. No account, WebView or network API. */
public final class DemoRuntime {
    private DemoRuntime() {}
    public static boolean isDemoProcess() {
        try {
            String process;
            if (Build.VERSION.SDK_INT >= 28) process = Application.getProcessName();
            else {
                byte[] b = new byte[256];
                try (FileInputStream in = new FileInputStream("/proc/self/cmdline")) {
                    int n = in.read(b); int end = 0;
                    while (end < n && b[end] != 0) end++;
                    process = new String(b, 0, end, "UTF-8");
                }
            }
            // If unknown, fail closed: never start updater in a possible demo process.
            return process == null || process.isEmpty() || process.endsWith(":demo");
        } catch (Exception ignored) { return true; }
    }
}
