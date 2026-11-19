.class Lcom/melodix/music/PreviewPlayerVolume$7;
.super Ljava/lang/Object;
.source "PreviewPlayerVolume.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerVolume;->open()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerVolume;

.field final synthetic val$d:Lcom/melodix/music/PreviewPlayerSheet;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;Lcom/melodix/music/PreviewPlayerSheet;)V
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

    .line 120
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    iput-object p2, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->val$d:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 120
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$7;->val$d:Lcom/melodix/music/PreviewPlayerSheet;

    invoke-virtual {p1}, Lcom/melodix/music/PreviewPlayerSheet;->dismiss()V

    return-void
.end method
