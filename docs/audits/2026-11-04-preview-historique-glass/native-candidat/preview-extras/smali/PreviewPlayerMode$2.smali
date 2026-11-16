.class Lcom/melodix/music/PreviewPlayerMode$2;
.super Ljava/lang/Object;
.source "PreviewPlayerMode.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerMode;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/melodix/music/PreviewPlayerMode;


# direct methods
.method constructor <init>(Lcom/melodix/music/PreviewPlayerMode;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 74
    iput-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$2;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 74
    iget-object p1, p0, Lcom/melodix/music/PreviewPlayerMode$2;->this$0:Lcom/melodix/music/PreviewPlayerMode;

    invoke-static {p1}, Lcom/melodix/music/PreviewPlayerMode;->access$400(Lcom/melodix/music/PreviewPlayerMode;)V

    return-void
.end method
