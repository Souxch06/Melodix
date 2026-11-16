.class Lcom/melodix/music/PreviewPlayerTiles$2;
.super Ljava/lang/Object;
.source "PreviewPlayerTiles.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$i:I


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V
    .locals 0

    .prologue
    .line 90
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iput p2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$i:I

    iput-object p3, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$a:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 90
    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    iget v1, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$i:I

    iget-object v2, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->val$a:Landroid/app/Activity;

    invoke-static {v0, v1, v2}, Lcom/melodix/music/PreviewPlayerTiles;->access$3(Lcom/melodix/music/PreviewPlayerTiles;ILandroid/app/Activity;)V

    iget-object v0, p0, Lcom/melodix/music/PreviewPlayerTiles$2;->this$0:Lcom/melodix/music/PreviewPlayerTiles;

    const-string v1, "Indisponible dans cette version"

    invoke-static {v0, v1}, Lcom/melodix/music/PreviewPlayerTiles;->access$4(Lcom/melodix/music/PreviewPlayerTiles;Ljava/lang/String;)V

    return-void
.end method
