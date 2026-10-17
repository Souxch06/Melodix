.class public final Lyy;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Lzy;


# direct methods
.method public constructor <init>(Lzy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lyy;->j:Lzy;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iget-object p0, p0, Lyy;->j:Lzy;

    .line 3
    .line 4
    iput-object v0, p0, Lzy;->u:Lyy;

    .line 5
    .line 6
    invoke-virtual {p0}, Lzy;->drawableStateChanged()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
