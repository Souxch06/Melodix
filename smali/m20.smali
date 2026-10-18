.class public final Lm20;
.super Lj0;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final k:Lyu;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lyu;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Lyu;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lm20;->k:Lyu;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Random;
    .locals 0

    .line 1
    iget-object p0, p0, Lm20;->k:Lyu;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Ljava/util/Random;

    .line 11
    .line 12
    return-object p0
.end method
