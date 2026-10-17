.class public final Lm4;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final a:Ljava/lang/Object;

.field public volatile b:Ljava/lang/Object;

.field public volatile c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/os/Looper;Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lq10;

    invoke-direct {v0, p1}, Lq10;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lm4;->a:Ljava/lang/Object;

    .line 37
    iput-object p2, p0, Lm4;->b:Ljava/lang/Object;

    new-instance p1, Lrj0;

    .line 38
    invoke-static {p3}, Lbh;->e(Ljava/lang/String;)V

    invoke-direct {p1, p2, p3}, Lrj0;-><init>(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lm4;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lis0;)V
    .locals 3

    .line 1
    new-instance v0, Lux;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ltb0;

    .line 7
    .line 8
    const/16 v2, 0x16

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ltb0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lm4;->c:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lm4;->a:Ljava/lang/Object;

    .line 24
    .line 25
    iput-object v1, p0, Lm4;->b:Ljava/lang/Object;

    .line 26
    .line 27
    new-instance v0, Ll4;

    .line 28
    .line 29
    invoke-direct {v0, p0}, Ll4;-><init>(Lm4;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lis0;->a(Llw;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public constructor <init>(Lzz;)V
    .locals 0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    iput-object p1, p0, Lm4;->a:Ljava/lang/Object;

    return-void
.end method
