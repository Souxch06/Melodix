.class Lcom/melodix/music/PreviewPlayerController$12;
.super Ljava/lang/Object;
.source "PreviewPlayerController.java"

# interfaces
.implements Landroid/webkit/ValueCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerController;->report()Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/webkit/ValueCallback<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerController;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerController;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1170
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onReceiveValue(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 1170
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/melodix/music/PreviewPlayerController$12;->onReceiveValue(Ljava/lang/String;)V

    return-void
.end method

.method public onReceiveValue(Ljava/lang/String;)V
    .locals 3

    .line 1170
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    if-nez p1, :cond_0

    const-string p1, "\u2014"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x104

    if-le v1, v2, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-static {v0, p1}, Lcom/melodix/music/PreviewPlayerController;->access$4802(Lcom/melodix/music/PreviewPlayerController;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerController$12;->this$0:Lcom/melodix/music/PreviewPlayerController;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerController;->access$4908(Lcom/melodix/music/PreviewPlayerController;)I

    return-void
.end method
