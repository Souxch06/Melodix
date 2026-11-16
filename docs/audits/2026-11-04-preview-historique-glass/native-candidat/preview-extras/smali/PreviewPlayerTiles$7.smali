.class Lcom/melodix/music/PreviewPlayerTiles$7;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field startY:F

.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 166
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    .line 167
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    if-nez p1, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iput p1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->startY:F

    return v0

    .line 168
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    if-ne p1, v0, :cond_1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p1

    iget p2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->startY:F

    sub-float/2addr p1, p2

    iget-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/high16 v1, 0x42800000    # 64.0f

    invoke-static {p2, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$1300(Lcom/melodix/music/PreviewPlayerTiles;F)I

    move-result p2

    int-to-float p2, p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$7;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 169
    :cond_1
    return v0
.end method
