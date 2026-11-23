.class Lcom/melodix/music/PreviewPlayerTiles$11;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->renderPanel(ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Lorg/json/JSONObject;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;

.field final synthetic val$a:Landroid/app/Activity;

.field final synthetic val$dialog:Landroid/app/Dialog;

.field final synthetic val$list:Landroid/widget/LinearLayout;

.field final synthetic val$retry:Landroid/widget/Button;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;Landroid/app/Activity;Landroid/widget/LinearLayout;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
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
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 280
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$dialog:Landroid/app/Dialog;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$a:Landroid/app/Activity;

    iput-object p4, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$list:Landroid/widget/LinearLayout;

    iput-object p5, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 280
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerTiles;->access$800(Lcom/melodix/music/PreviewPlayerTiles;)Lcom/melodix/music/PreviewPlayerSheet;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$dialog:Landroid/app/Dialog;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2502(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v4, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$a:Landroid/app/Activity;

    iget-object v5, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$dialog:Landroid/app/Dialog;

    iget-object v6, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$list:Landroid/widget/LinearLayout;

    iget-object v7, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->val$retry:Landroid/widget/Button;

    const-string v8, "run"

    const-string v9, ""

    const/4 v3, 0x1

    invoke-static/range {v2 .. v9}, Lcom/melodix/music/PreviewPlayerTiles;->access$2600(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$11;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$2502(Lcom/melodix/music/PreviewPlayerTiles;Z)Z

    :goto_0
    return-void
.end method
