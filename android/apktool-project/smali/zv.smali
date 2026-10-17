.class public final Lzv;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final f:Ljava/util/logging/Logger;


# instance fields
.field public final a:Lc9;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Lyn0;

.field public final d:Lh21;

.field public final e:Lh21;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-class v0, Lxd1;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Lzv;->f:Ljava/util/logging/Logger;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/util/concurrent/Executor;Lyn0;Lc9;Lh21;Lh21;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lzv;->b:Ljava/util/concurrent/Executor;

    .line 5
    .line 6
    iput-object p2, p0, Lzv;->c:Lyn0;

    .line 7
    .line 8
    iput-object p3, p0, Lzv;->a:Lc9;

    .line 9
    .line 10
    iput-object p4, p0, Lzv;->d:Lh21;

    .line 11
    .line 12
    iput-object p5, p0, Lzv;->e:Lh21;

    .line 13
    .line 14
    return-void
.end method
