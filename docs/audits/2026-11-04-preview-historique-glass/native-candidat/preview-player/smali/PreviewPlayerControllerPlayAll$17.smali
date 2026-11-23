.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->close(Landroid/app/Dialog;Ljava/lang/Runnable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$dlg:Landroid/app/Dialog;

.field final synthetic val$then:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 287
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$dlg:Landroid/app/Dialog;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$then:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$dlg:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$then:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$then:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    return-void
.end method
