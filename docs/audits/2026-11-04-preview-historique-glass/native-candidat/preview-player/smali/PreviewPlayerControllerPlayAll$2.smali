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

    .line 33
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$root:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 34
    const/4 p1, 0x0

    :goto_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$root:Landroid/view/View;

    add-int/lit8 v1, p1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->find(Landroid/view/View;Ljava/lang/String;)Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_0

    const/16 v0, 0x1f4

    if-ge p1, v0, :cond_0

    move p1, v1

    goto :goto_0

    .line 35
    :cond_0
    if-lez p1, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;->val$root:Landroid/view/View;

    new-instance v1, Ljava/util/Random;

    invoke-direct {v1}, Ljava/util/Random;-><init>()V

    invoke-virtual {v1, p1}, Ljava/util/Random;->nextInt(I)I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->tap(Landroid/view/View;Ljava/lang/String;)V

    .line 36
    :cond_1
    return-void
.end method
