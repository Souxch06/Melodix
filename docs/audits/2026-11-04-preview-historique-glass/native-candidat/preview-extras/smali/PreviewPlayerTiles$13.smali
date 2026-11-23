.class Lcom/melodix/music/PreviewPlayerTiles$13;
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

.field final synthetic val$action:Ljava/lang/String;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$i:I

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;

.field final synthetic val$serial:J


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;JLandroid/app/Dialog;ILjava/lang/String;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
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
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 293
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-wide p2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    iput p5, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iput-object p6, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$action:Ljava/lang/String;

    iput-object p7, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iput-object p8, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iput-object p9, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 293
    iget-wide v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$2700(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$2800(Lcom/melodix/music/PreviewPlayerTiles;)J

    move-result-wide v0

    iget-wide v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$serial:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/melodix/music/PreviewPlayerTiles;->access$2900()[Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    add-int/lit8 v1, v1, -0x1

    const-string v2, "delai"

    aput-object v2, v0, v1

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$action:Ljava/lang/String;

    const-string v1, "transfer"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    const-string v5, "Transfert non v\u00e9rifi\u00e9"

    const-string v6, "R\u00e9sultat incertain. V\u00e9rifiez l\u2019appareil actif avant toute nouvelle tentative."

    invoke-static/range {v1 .. v6}, Lcom/melodix/music/PreviewPlayerTiles;->access$3000(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$a:Landroid/app/Activity;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$list:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$13;->val$retry:Landroid/widget/Button;

    invoke-static {v0, v1, v2, v3, v4}, Lcom/melodix/music/PreviewPlayerTiles;->access$3100(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    :cond_1
    :goto_0
    return-void
.end method
