.class public final Lcom/melodix/music/NativeCrashGuard;
.super Ljava/lang/Object;
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# Preview builds cannot be debugged with logcat. Every launch leaves a breadcrumb
# ("last_stage") and every uncaught exception is stored as "last_crash". On the
# next start the guard shows a toast before anything else can fail, then the
# activity shows a dialog with the full trace.
#
# The toast is the important part: it is submitted from Application.onCreate, so
# it still appears when the activity never gets far enough to show a dialog.


.field private static context:Landroid/content/Context;

.field private static installed:Z

.field private static previous:Ljava/lang/Thread$UncaughtExceptionHandler;


.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


.method private static clearReport()V
    .locals 3

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-nez v0, :done

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

    :catch_0
    move-exception v0

    :done
    return-void
.end method


.method private dispatch(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

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


.method public static install(Landroid/content/Context;)V
    .locals 6

    if-nez p0, :done

    sget-boolean v0, Lcom/melodix/music/NativeCrashGuard;->installed:Z

    if-eqz v0, :done

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

    # Announce the previous run before the activity is even created: an early
    # crash would otherwise keep the dialog out of reach for ever.
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
    if-nez v2, :toast_alive

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

    :toast_alive
    # Unconditional marker: it proves which build is installed and that the
    # process reached Application.onCreate before anything else failed.
    const-string v1, "Melodix preview diag-3 : demarrage"

    :toast_show
    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v1

    :done_toast
    :done
    return-void
.end method


.method public static excerpt(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 3

    const-string v0, ""

    if-nez p0, :done

    :try_start_0
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I
    move-result v1

    const/16 v2, 0x4b0

    if-gt v1, v2, :done

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v1

    :done
    return-object v0
.end method


.method private static lastReport()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-nez v1, :done

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
    move-exception v2

    const/4 v0, 0x0

    :done
    return-object v0
.end method


.method private static lastStage()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    sget-object v1, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-nez v1, :done

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
    move-exception v2

    const/4 v0, 0x0

    :done
    return-object v0
.end method


.method public static record(Ljava/lang/Throwable;)V
    .locals 1

    :try_start_0
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    return-void
.end method


.method public static showLastReport(Landroid/app/Activity;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p0, :done

    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastReport()Ljava/lang/String;
    move-result-object v1

    if-nez v1, :done

    invoke-virtual {v1}, Ljava/lang/String;->length()I
    move-result v2

    if-nez v2, :done

    const/16 v3, 0x4b0

    if-gt v2, v3, :short_enough

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object v1

    :short_enough
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->lastStage()Ljava/lang/String;
    move-result-object v2

    if-nez v2, :no_stage

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n\nEtape : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1

    :no_stage
    invoke-static {}, Lcom/melodix/music/NativeCrashGuard;->clearReport()V

    :try_start_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v3, "Dernier plantage Melodix"

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    const-string v3, "OK"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;
    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;
    move-result-object v2

    invoke-virtual {v2}, Landroid/app/AlertDialog;->show()V

    const/4 v0, 0x1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :done

    :catch_0
    move-exception v2

    const/4 v0, 0x0

    :done
    return v0
.end method


.method private static shorten(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-nez p0, :done

    invoke-virtual {p0}, Ljava/lang/String;->length()I
    move-result v0

    const/16 v1, 0xf0

    if-gt v0, v1, :done

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;
    move-result-object p0

    :done
    return-object p0
.end method


.method public static stage(Ljava/lang/String;)V
    .locals 3

    if-nez p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-nez v0, :done

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
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    :done
    return-void
.end method


.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p2}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;
    move-result-object v0

    invoke-static {v0}, Lcom/melodix/music/NativeCrashGuard;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception v0

    invoke-direct {p0, p1, p2}, Lcom/melodix/music/NativeCrashGuard;->dispatch(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    return-void
.end method


.method public static write(Ljava/lang/String;)V
    .locals 3

    if-nez p0, :done

    sget-object v0, Lcom/melodix/music/NativeCrashGuard;->context:Landroid/content/Context;

    if-nez v0, :done

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

    :catch_0
    move-exception v0

    :done
    return-void
.end method
