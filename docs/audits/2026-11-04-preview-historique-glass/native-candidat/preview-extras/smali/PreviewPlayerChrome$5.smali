.class Lcom/melodix/music/PreviewPlayerChrome$5;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerChrome;->sync()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;

.field private final synthetic val$p:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;)V
    .locals 0

    .prologue
    .line 506
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$5;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$5;->val$p:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 506
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$5;->val$p:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
