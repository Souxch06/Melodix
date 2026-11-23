.class Lcom/melodix/music/PreviewPlayerTiles$6$3;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles$6;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

.field final synthetic val$ask:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles$6;Landroid/app/Dialog;)V
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

    .line 202
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->val$ask:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    .line 202
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->val$ask:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->dismiss()V

    .line 203
    :try_start_0
    const-string p1, "com.melodix.music.PreviewPlayerControllerQueue"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "removeUpcoming"

    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget v0, v0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$index:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 204
    :goto_0
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget-object p1, p1, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget-object v0, v0, Lcom/melodix/music/PreviewPlayerTiles$6;->val$a:Landroid/app/Activity;

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget-object v1, v1, Lcom/melodix/music/PreviewPlayerTiles$6;->val$dialog:Landroid/app/Dialog;

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget-object v2, v2, Lcom/melodix/music/PreviewPlayerTiles$6;->val$list:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lcom/melodix/music/PreviewPlayerTiles$6$3;->this$1:Lcom/melodix/music/PreviewPlayerTiles$6;

    iget-object v3, v3, Lcom/melodix/music/PreviewPlayerTiles$6;->val$retry:Landroid/widget/Button;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/melodix/music/PreviewPlayerTiles;->access$1100(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Activity;Landroid/app/Dialog;Landroid/widget/LinearLayout;Landroid/widget/Button;)V

    return-void
.end method
