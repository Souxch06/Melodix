.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$root:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 30
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->random(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$1;->val$root:Landroid/view/View;

    const-string v0, "1"

    invoke-static {p1, v0}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->tap(Landroid/view/View;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
