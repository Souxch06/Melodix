.class Lcom/melodix/music/PreviewPlayerTiles$6;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerTiles;->activate(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerTiles;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;)V
    .locals 0

    .prologue
    .line 119
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2

    .prologue
    .line 119
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$6;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$8(Lcom/melodix/music/PreviewPlayerTiles;Landroid/app/Dialog;)V

    return-void
.end method
