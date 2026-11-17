.class Lcom/melodix/music/PreviewPlayerChrome$3;
.super Ljava/lang/Object;
.source "PreviewPlayerChrome.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerChrome;->closeAnimated(Landroid/app/Activity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerChrome;

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$p:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerChrome;Landroid/view/View;Landroid/app/Activity;)V
    .locals 0

    .prologue
    .line 310
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v1, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 311
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0}, Lcom/melodix/music/PreviewPlayerChrome;->access$12(Lcom/melodix/music/PreviewPlayerChrome;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 316
    :goto_0
    return-void

    .line 312
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->access$15(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerChrome;->access$16(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    .line 313
    :try_start_0
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$a:Landroid/app/Activity;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "onNativeBackClick"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Landroid/view/View;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$a:Landroid/app/Activity;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 315
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->access$16(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    .line 314
    :catch_0
    move-exception v0

    :try_start_1
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 315
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v0, v5}, Lcom/melodix/music/PreviewPlayerChrome;->access$16(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v0, v6}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v0, v7}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->this$0:Lcom/melodix/music/PreviewPlayerChrome;

    invoke-static {v1, v5}, Lcom/melodix/music/PreviewPlayerChrome;->access$16(Lcom/melodix/music/PreviewPlayerChrome;Z)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v1, v6}, Landroid/view/View;->setTranslationY(F)V

    iget-object v1, p0, Lcom/melodix/music/PreviewPlayerChrome$3;->val$p:Landroid/view/View;

    invoke-virtual {v1, v7}, Landroid/view/View;->setAlpha(F)V

    throw v0
.end method
