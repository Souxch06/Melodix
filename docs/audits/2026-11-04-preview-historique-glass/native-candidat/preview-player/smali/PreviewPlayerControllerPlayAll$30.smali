.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->sleepTimer(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$labels:[Ljava/lang/String;

.field final synthetic val$mins:[J


# direct methods
.method constructor <init>(Landroid/app/Activity;[J[Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 401
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$mins:[J

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$labels:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    .line 403
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$mins:[J

    aget-wide v1, v0, p2

    invoke-static {p1, v1, v2}, Lcom/melodix/music/PreviewPlayerController;->sleep(Landroid/app/Activity;J)V

    .line 404
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$a:Landroid/app/Activity;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$mins:[J

    aget-wide v1, v0, p2

    const-wide/16 v3, 0x0

    cmp-long v0, v1, v3

    if-nez v0, :cond_0

    const-string p2, "Minuterie d\u00e9sactiv\u00e9e"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$mins:[J

    aget-wide v1, v0, p2

    cmp-long v0, v1, v3

    if-gez v0, :cond_1

    const-string p2, "Pause \u00e0 la fin du titre"

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Pause dans "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerControllerPlayAll$30;->val$labels:[Ljava/lang/String;

    aget-object p2, v1, p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-static {p1, p2}, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->toast(Landroid/app/Activity;Ljava/lang/String;)V

    .line 405
    return-void
.end method
