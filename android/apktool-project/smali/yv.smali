.class public final Lyv;
.super Lr10;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final m:Lyv;


# instance fields
.field public l:Lyq;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    new-instance v0, Lyv;

    .line 2
    .line 3
    sget v2, Lrb1;->c:I

    .line 4
    .line 5
    sget v3, Lrb1;->d:I

    .line 6
    .line 7
    sget-wide v4, Lrb1;->e:J

    .line 8
    .line 9
    sget-object v6, Lrb1;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v0}, Luq;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v1, Lyq;

    .line 15
    .line 16
    invoke-direct/range {v1 .. v6}, Lyq;-><init>(IIJLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iput-object v1, v0, Lyv;->l:Lyq;

    .line 20
    .line 21
    sput-object v0, Lyv;->m:Lyv;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "Dispatchers.Default cannot be closed"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public final r(Lsq;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lyv;->l:Lyq;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p2, p1}, Lyq;->g(Ljava/lang/Runnable;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Dispatchers.Default"

    .line 2
    .line 3
    return-object p0
.end method
