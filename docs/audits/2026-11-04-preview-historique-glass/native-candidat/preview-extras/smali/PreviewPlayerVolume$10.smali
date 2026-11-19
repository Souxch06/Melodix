.class Lcom/melodix/music/PreviewPlayerVolume$10;
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


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerVolume;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 136
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerVolume$10;->this$0:Lcom/melodix/music/PreviewPlayerVolume;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerVolume;->access$400(Lcom/melodix/music/PreviewPlayerVolume;)V

    return-void
.end method
