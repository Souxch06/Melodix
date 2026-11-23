.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;
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

    .line 259
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$dlg:Landroid/app/Dialog;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$action:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 259
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$dlg:Landroid/app/Dialog;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$17;->val$action:Ljava/lang/Runnable;

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->close(Landroid/app/Dialog;Ljava/lang/Runnable;)V

    return-void
.end method
