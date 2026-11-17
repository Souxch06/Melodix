.class Lcom/melodix/music/PreviewPlayerTiles$12;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->loadPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$i:I

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 235
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$list:Landroid/widget/LinearLayout;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 235
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2000(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Landroid/app/Dialog;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2100(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$serial:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const-string v0, "delai"

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2202(Ljava/lang/String;)Ljava/lang/String;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$12;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$2300(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    :cond_0
    return-void
.end method
