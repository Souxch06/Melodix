.class public final Lcom/melodix/music/NativeCrashGuard;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static context:Landroid/content/Context;

# Set when this process wrote a startup report: a recovery in the SAME
# launch must not replay it as history at the next showNativeUi.
.field public static written:Z

.field private static installed:Z

.field private static previous:Ljava/lang/Thread$UncaughtExceptionHandler;

# Elapsed-realtime origin for the startup stage chain (0 = not set yet).
.field private static chainStart:J

# Ephemeral per-process correlation id for bounded diagnostic traces only.
.field private static diagnosticSessionId:Ljava/lang/String;


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

    const-string v1, "last_verify_class"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_verify_method"

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
    .locals 2

    const-string v0, ""

    if-eqz p0, :done

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

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

    # Keep the next phone-side report specific to this process. This removes
    # only last_diag; crash reports and all Spotify/session preferences remain.
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->clearDiagnosticTrail()V

    const-string v1, "native-launch fresh"

    invoke-static {v1}, Lcom/melodix/music/NativeCrashGuard;->diagLine(Ljava/lang/String;)V

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

    # Preferences can contain a pre-update raw stack or URL from an older
    # version. Sanitize before any toast, diagnostic panel, or bridge can read it.
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->sanitizeStoredReport(Ljava/lang/String;)Ljava/lang/String;

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

.method private static sanitizeStoredReport(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    if-eqz p0, :sanitize_null

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x1000

    if-gt v0, v1, :sanitize_redacted

    const-string v0, "STARTUP STUCK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :sanitize_hang

    const-string v0, "CONTENT STUCK"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :sanitize_hang

    # Exception-class records written by current builds are short identifiers
    # only. Any legacy message or stack fails this strict allowlist.
    const-string v0, "(Exception|Error|Throwable|[A-Z][A-Za-z0-9_$]*(Exception|Error|Throwable))"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :sanitize_return

    goto :sanitize_redacted

    :sanitize_hang
    # Keep only the bounded, route-free watchdog reports produced by the
    # current diagnostic format. Old persisted URLs, query strings and tokens
    # are rejected even if their report has a familiar prefix.
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "%"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "#"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "spotify.com"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "access_token"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "refresh_token"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    const-string v0, "Bearer "

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :sanitize_redacted

    :sanitize_return
    return-object p0

    :sanitize_redacted
    const-string v0, "Previous diagnostic details redacted"

    return-object v0

    :sanitize_null
    const/4 v0, 0x0

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
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V

    # Only VerifyError diagnostics are inspected, and only class/method
    # identifiers from the exception are retained. The message is never
    # persisted, logged, displayed or sent through a bridge.
    invoke-static {p0}, Lcom/melodix/music/NativeCrashGuard;->recordVerifyTarget(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

# For a VerifyError only, parse the framework message in memory with strict
# package/method patterns. Persist two identifiers; never retain the message.
.method private static recordVerifyTarget(Ljava/lang/Throwable;)V
    .locals 5

    const/4 v0, 0x0
    invoke-static {v0, v0}, Lcom/melodix/music/NativeCrashGuard;->storeVerifyTarget(Ljava/lang/String;Ljava/lang/String;)V

    instance-of v0, p0, Ljava/lang/VerifyError;
    if-eqz v0, :done

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;
    move-result-object v0
    if-eqz v0, :done

    const-string v1, "(com\\.melodix\\.music(?:\\.[A-Za-z0-9_$]+)+)\\.([A-Za-z0-9_$<>]+)\\("
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
    move-result v2
    if-eqz v2, :verify_target_class_only

    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x2
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v3
    invoke-static {v2, v3}, Lcom/melodix/music/NativeCrashGuard;->storeVerifyTarget(Ljava/lang/String;Ljava/lang/String;)V
    goto :verify_target_done

    :verify_target_class_only
    const-string v1, "(com\\.melodix\\.music(?:\\.[A-Za-z0-9_$]+)+)"
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;
    move-result-object v1
    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;
    move-result-object v1
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z
    move-result v2
    if-eqz v2, :verify_target_done
    const/4 v2, 0x1
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;
    move-result-object v2
    const/4 v3, 0x0
    invoke-static {v2, v3}, Lcom/melodix/music/NativeCrashGuard;->storeVerifyTarget(Ljava/lang/String;Ljava/lang/String;)V
    :verify_target_done
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :verify_target_catch

    goto :done

    :verify_target_catch
    move-exception v0

    :done
    return-void
.end method

.method private static storeVerifyTarget(Ljava/lang/String;Ljava/lang/String;)V
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

    if-eqz p0, :verify_target_clear
    const-string v1, "last_verify_class"
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    if-eqz p1, :verify_target_remove_method
    const-string v1, "last_verify_method"
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    goto :verify_target_commit

    :verify_target_remove_method
    const-string v1, "last_verify_method"
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    goto :verify_target_commit

    :verify_target_clear
    const-string v1, "last_verify_class"
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "last_verify_method"
    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;
    move-result-object v0

    :verify_target_commit
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    move-result v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :verify_target_store_catch

    goto :done

    :verify_target_store_catch
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
.method public static declared-synchronized diagnosticSessionId()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->diagnosticSessionId:Ljava/lang/String;
    if-eqz v0, :create_diagnostic_session_id
    return-object v0

    :create_diagnostic_session_id
    :try_start_diagnostic_session_id
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
    move-result-object v0
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;
    move-result-object v0
    const/4 v1, 0x0
    const/16 v2, 0x8
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    sput-object v0, Lcom/melodix/music/NativeCrashGuard;->diagnosticSessionId:Ljava/lang/String;
    :try_end_diagnostic_session_id
    .catch Ljava/lang/Throwable; {:try_start_diagnostic_session_id .. :try_end_diagnostic_session_id} :catch_diagnostic_session_id

    return-object v0

    :catch_diagnostic_session_id
    move-exception v0
    const-string v0, "00000000"
    sput-object v0, Lcom/melodix/music/NativeCrashGuard;->diagnosticSessionId:Ljava/lang/String;
    return-object v0
.end method

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

.method public static stageLoadedAsset(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    # Only fixed APK asset names become stages. A file read counts as loaded
    # only when the returned source is non-null and non-empty; this is distinct
    # from the later WebView injection and JavaScript execution markers.
    if-eqz p0, :asset_stage_done
    if-eqz p1, :asset_stage_done

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z
    move-result v0
    if-nez v0, :asset_stage_done

    const-string v0, "native_ui_shell.js"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :asset_stage_bridge
    const-string v0, "shell-asset-loaded"
    goto :asset_stage_record

    :asset_stage_bridge
    const-string v0, "spotify_bridge.js"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :asset_stage_home
    const-string v0, "bridge-asset-loaded"
    goto :asset_stage_record

    :asset_stage_home
    const-string v0, "melodix_home.js"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :asset_stage_css
    const-string v0, "home-asset-loaded"
    goto :asset_stage_record

    :asset_stage_css
    const-string v0, "css_hacks.css"
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v1
    if-eqz v1, :asset_stage_done
    const-string v0, "css-asset-loaded"

    :asset_stage_record
    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V

    :asset_stage_done
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

    const/16 v4, 0x400

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

# Clears only per-process diagnostics at startup. Spotify cookies, account
# preferences, and stored crash/hang reports remain intact; persisted stages and
# verifier targets from the prior process cannot taint this launch's report.
.method private static clearDiagnosticTrail()V
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

    const-string v1, "last_diag"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_stage"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "stage_chain"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_verify_class"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_verify_method"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

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

# Keeps the last JS diagnostic lines (status words only) in the prefs so a
# phone report can show where the web side stopped - logcat is unreachable on
# a user device. Tail-bounded: a chatty caller cannot flood the prefs.
.method public static diagLine(Ljava/lang/String;)V
    .locals 6

    if-eqz p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-eqz v0, :done

    :try_start_0
    # Prefix every stored event with the same ephemeral process id. JS traces
    # already carry it; native events receive it here. No account data is used.
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->diagnosticSessionId()Ljava/lang/String;
    move-result-object v4
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    const-string v1, "sid="
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v1, " "
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v4
    invoke-virtual {p0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result v5
    if-eqz v5, :prefix_diagnostic_id
    goto :diagnostic_id_ready

    :prefix_diagnostic_id
    new-instance v5, Ljava/lang/StringBuilder;
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object p0

    :diagnostic_id_ready
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
    .locals 1

    if-eqz p0, :done

    # The window is already branded before this runs: the launch theme paints
    # android:windowBackground (dark background + centred logo) from the very
    # first frame. Painting a black screen with "Melodix diag-6 : demarrage"
    # here replaced that brand with developer text on every single launch.
    # The marker keeps its diagnostic value without drawing anything: it
    # records a stage, so the startup chain proves the activity reached this
    # point. A process that dies earlier simply never records it.
    :try_start_0
    const-string v0, "launch-marker"

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->stage(Ljava/lang/String;)V
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

    :try_start_0
    # Persist only the exception class through record(); raw stack traces and
    # messages may contain Spotify routes or request details.
    invoke-static {p2}, Lcom/melodix/music/NativeCrashGuard;->record(Ljava/lang/Throwable;)V
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

    const/4 v0, 0x1

    sput-boolean v0, Lcom/melodix/music/NativeCrashGuard;->written:Z

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

# Records only the WebView throwable class name. Exception messages can contain
# routes or request details, so they are never stored or shown.
.method public static recordWebViewFailure(Ljava/lang/Throwable;)V
    .locals 2

    :try_start_0
    if-nez p0, :have_class

    const-string v0, "Throwable"

    goto :class_done

    :have_class
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    :class_done
    # Keep only the exception type. Messages may contain URLs or request detail.
    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method

# Same report as recordWebViewFailure, prefixed so the diagnostic screen tells
# "the engine could not be built" apart from "the engine was built but one
# configuration or first-load step failed". The second case used to be silent:
# the WebView was discarded and the cause was lost.
.method public static recordWebViewConfigFailure(Ljava/lang/Throwable;)V
    .locals 2

    :try_start_0
    invoke-static {p0}, Lcom/melodix/music/NativeCrashGuard;->recordWebViewFailure(Ljava/lang/Throwable;)V

    sget-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    if-nez v0, :done

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "config apres creation \u2014 "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/melodix/music/AppSingleton;->g0:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v0

    :done
    return-void
.end method
