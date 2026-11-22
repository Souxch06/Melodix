.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->item(Landroid/app/Activity;ILjava/lang/String;Ljava/lang/Runnable;Landroid/app/Dialog;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$action:Ljava/lang/Runnable;

.field final synthetic val$dlg:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/app/Dialog;Ljava/lang/Runnable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 198
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$dlg:Landroid/app/Dialog;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$action:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 198
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$dlg:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    :try_start_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$10;->val$action:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    :goto_0
    return-void
.end method
