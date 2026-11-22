.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;
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

    .line 34
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$root:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 35
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 36
    sget-boolean p1, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$root:Landroid/view/View;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->random(Landroid/view/View;)V

    .line 37
    :cond_0
    return-void
.end method
