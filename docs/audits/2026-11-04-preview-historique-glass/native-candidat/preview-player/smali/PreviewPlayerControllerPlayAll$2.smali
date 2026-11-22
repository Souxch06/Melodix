.class Lcom/melodix/music/PreviewPlayerControllerPlayAll$2;
.super Ljava/lang/Object;
.source "PreviewPlayerControllerPlayAll.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/melodix/music/PreviewPlayerControllerPlayAll;->add(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 47
    sget-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/melodix/music/PreviewPlayerControllerPlayAll;->shuffleOn:Z

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 48
    return-void
.end method
