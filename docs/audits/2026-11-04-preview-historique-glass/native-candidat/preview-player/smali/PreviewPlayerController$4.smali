.class Lcom/melodix/music/PreviewPlayerController$4;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->crashCatcher(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$p:Landroid/content/SharedPreferences;

.field final synthetic val$prev:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 306
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$4;->val$p:Landroid/content/SharedPreferences;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerController$4;->val$prev:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3

    .line 307
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4;->val$p:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "t"

    invoke-static {p2}, Lcom/melodix/music/PreviewPlayerController;->crashTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 308
    :goto_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4;->val$prev:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$4;->val$prev:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 309
    :cond_0
    return-void
.end method
