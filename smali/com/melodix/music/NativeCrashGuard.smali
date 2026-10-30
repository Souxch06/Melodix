.class public final Lcom/melodix/music/NativeCrashGuard;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static context:Landroid/content/Context;

.field private static installed:Z

.field private static previous:Ljava/lang/Thread$UncaughtExceptionHandler;

# Elapsed-realtime origin for the startup stage chain (0 = not set yet).
.field private static chainStart:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

# Forget the report that was just displayed, so it is not shown twice.
.method private static clearReport()V
    .locals 3

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_crash"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_stage"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v2

    :done
    return-void
.end method

# Hand the crash to whichever handler was installed before us. When there is
# none, exit the way Android would, without the framework dialog.
.method private dispatch(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :kill

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void

    :kill
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    return-void
.end method

.method public static excerpt(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    if-eqz p0, :done

    :try_start_0
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x4b0

    if-le v1, v2, :done

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1

    const-string v0, ""

    :done
    return-object v0
.end method

# Installs the handler once, then announces the previous run. The toast is
# posted here, before any activity exists, because the system keeps showing a
# toast that was already queued even if this process dies right afterwards.
.method public static install(Landroid/content/Context;)V
    .locals 6

    # P0 fix: both guards were inverted (a recurring polarity bug): with a
    # valid context the method returned immediately and never installed
    # anything - no crash handler, no toast, no context, and stage()/write()/
    # lastReport() silently stayed dead (their context was never stored).
    # if-eqz skips only on a NULL context; if-nez skips only when ALREADY
    # installed.
    if-eqz p0, :done

    sget-boolean v0, Lcom/melodix/music/NativeCrashGuard;->installed:Z

    if-nez v0, :done

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    if-nez v0, :store

    move-object v0, p0

    :store
    sput-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v1

    sput-object v1, Lcom/melodix/music/NativeCrashGuard;->previous:Ljava/lang/Thread$UncaughtExceptionHandler;

    new-instance v1, Lcom/melodix/music/NativeCrashGuard;

    invoke-direct {v1}, Lcom/melodix/music/NativeCrashGuard;-><init>()V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    const/4 v1, 0x1

    sput-boolean v1, Lcom/melodix/music/NativeCrashGuard;->installed:Z

    :try_start_0
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastReport()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;

    move-result-object v2

    if-nez v1, :toast_stage

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Melodix a plante : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->shorten(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :toast_show

    :toast_stage
    if-eqz v2, :toast_alive

    const-string v1, "ready"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :toast_alive

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Melodix s est arrete a l etape : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :toast_show

    # Nothing to report: still announce that this build ran, so a phone that
    # shows nothing at all can be told apart from an APK that never reaches
    # application code.
    :toast_alive
    const-string v1, "Melodix preview diag-5 : actif"

    :toast_show
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done_toast

    :catch_0
    move-exception v1

    :done_toast
    :done
    return-void
.end method

.method public static lastReport()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v1, :done

    :try_start_0
    const-string v2, "melodix_native"

    const/4 v0, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "last_crash"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1

    const/4 v0, 0x0

    :done
    return-object v0
.end method

.method public static lastStage()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v1, :done

    :try_start_0
    const-string v2, "melodix_native"

    const/4 v0, 0x0

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "last_stage"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1

    const/4 v0, 0x0

    :done
    return-object v0
.end method

.method public static record(Ljava/lang/Throwable;)V
    .locals 1

    if-eqz p0, :done

    :try_start_0
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

.method public static showLastReport(Landroid/app/Activity;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :done

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastReport()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :try_stage

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :try_stage

    const/16 v3, 0x4b0

    if-le v2, v3, :short_enough

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :short_enough
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :no_stage

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n\nEtape : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :no_stage
    :try_start_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Dernier plantage Melodix"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const/4 v3, 0x0

    const-string v4, "Fermer"

    invoke-virtual {v2, v4, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->clearReport()V

    const/4 v0, 0x1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v2

    const/4 v0, 0x0

    :done
    return v0

    # No Java exception was recorded, yet the previous launch never reached
    # "ready": the process died natively or was killed before the startup
    # resolved. The stage trail survives any kind of death - surface it
    # photo-ready instead of staying silent.
    :try_stage
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :done

    const-string v3, "ready"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :done

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Demarrage interrompu : le processus est mort avant la fin du demarrage (crash natif ou kill systeme).\nEtape atteinte : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\nBuild : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p0}, Lcom/melodix/music/NativeCrashGuard;->buildLabel(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :no_stage
.end method

# Build label of the running APK (versionName, e.g. 1.2.2-<sha7>) so a photo
# of any report identifies the exact binary. All control flow stays inside the
# try range; never fails: "?".
.method private static buildLabel(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    if-eqz p0, :label_fail

    :try_start_label
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    if-eqz v0, :label_fail_in

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :label_fail_in

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    if-eqz v0, :label_fail_in

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    if-eqz v0, :label_fail_in

    goto :label_done

    :label_fail_in
    const-string v0, "?"

    :label_done
    :try_end_label
    .catch Ljava/lang/Throwable; {:try_start_label .. :try_end_label} :catch_label

    return-object v0

    :catch_label
    move-exception v0

    const-string v0, "?"

    return-object v0

    :label_fail
    const-string v0, "?"

    return-object v0
.end method

.method public static shorten(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-eqz p0, :done

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xf0

    if-le v0, v1, :done

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    :done
    return-object p0
.end method

# Records how far the current launch got. A crash before "ready" leaves this
# value behind, which is the only clue available on a phone without logcat.
.method public static stage(Ljava/lang/String;)V
    .locals 3

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_stage"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0

    invoke-static {p0}, Lcom/melodix/music/NativeCrashGuard;->appendChain(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v2

    :done
    return-void
.end method

# Appends "name+Xs" to the startup stage chain so a phone report shows the
# whole trail with timestamps, not just the last step. Capped: a runaway
# caller cannot flood the prefs.
.method private static appendChain(Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    sget-wide v1, Lcom/melodix/music/NativeCrashGuard;->chainStart:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :chain_have_start

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    sput-wide v1, Lcom/melodix/music/NativeCrashGuard;->chainStart:J

    :chain_have_start
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sub-long/2addr v3, v1

    const-wide/16 v1, 0x3e8

    div-long/2addr v3, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "+"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "s "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "melodix_native"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "stage_chain"

    const-string v3, ""

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x17c

    if-le v3, v4, :chain_append

    goto :done

    :chain_append
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v3, "stage_chain"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

# Keeps the last JS diagnostic lines (status words only) in the prefs so a
# phone report can show where the web side stopped - logcat is unreachable on
# a user device. Tail-bounded: a chatty caller cannot flood the prefs.
.method public static diagLine(Ljava/lang/String;)V
    .locals 4

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "last_diag"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " | "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x400

    if-le v2, v3, :diag_store

    add-int/lit16 v2, v2, -0x400

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :diag_store
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "last_diag"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

# The last JS diagnostic lines kept for the report ("" when none).
.method public static lastDiag()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :empty

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "last_diag"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :empty
    const-string v0, ""

    return-object v0
.end method

# The startup stage chain recorded so far ("" when nothing ran yet).
.method public static stageChain()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :empty

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "stage_chain"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :empty
    const-string v0, ""

    return-object v0
.end method

# Paints a small marker with its own registers. Called from onCreate before the
# signature gate: if this text never shows, the process died before the activity
# existed; if it flashes, the failure is later and the stage trail says where.
.method public static showLaunchMarker(Landroid/app/Activity;)V
    .locals 3

    if-eqz p0, :done

    :try_start_0
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const-string v1, "Melodix diag-6 : demarrage"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    const/high16 v1, 0x41a00000

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    const v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method


.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :dispatch

    :catch_0
    move-exception v0

    :dispatch
    # Window-token races (a Toast or dialog whose activity died between show()
    # and its window attach) are already recorded above: killing the process
    # would only surface a crash dialog for a benign UI race. Swallow exactly
    # this class; every other throwable keeps the default kill path.
    instance-of v0, p2, Landroid/view/WindowManager$BadTokenException;

    if-eqz v0, :forward

    return-void

    :forward
    # Post-mortem shutdown races: an okhttp pool thread spawned after the VM
    # began shutting down can only fire while the process is already dying.
    # Swallow exactly that signature; the record above keeps it diagnostic.
    instance-of v0, p2, Ljava/lang/InternalError;

    if-eqz v0, :kill

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :kill

    const-string v1, "Thread starting during runtime shutdown"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :kill

    return-void

    :kill
    invoke-direct {p0, p1, p2}, Lcom/melodix/music/NativeCrashGuard;->dispatch(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static write(Ljava/lang/String;)V
    .locals 3

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    const-string v1, "melodix_native"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_crash"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method
