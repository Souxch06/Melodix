.class public abstract Lfp1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Z


# instance fields
.field public a:Lmd1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-boolean v0, Ler1;->d:Z

    .line 2
    .line 3
    sput-boolean v0, Lfp1;->b:Z

    .line 4
    .line 5
    return-void
.end method

.method public static a(I)I
    .locals 0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-int/lit8 p0, p0, 0x9

    .line 6
    .line 7
    rsub-int p0, p0, 0x160

    .line 8
    .line 9
    ushr-int/lit8 p0, p0, 0x6

    .line 10
    .line 11
    return p0
.end method

.method public static b(J)I
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ljava/lang/Long;->numberOfLeadingZeros(J)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    mul-int/lit8 p0, p0, 0x9

    .line 6
    .line 7
    rsub-int p0, p0, 0x280

    .line 8
    .line 9
    ushr-int/lit8 p0, p0, 0x6

    .line 10
    .line 11
    return p0
.end method


# virtual methods
.method public abstract c([BII)V
.end method

.method public abstract d(II)V
.end method

.method public abstract e(II)V
.end method

.method public abstract f(II)V
.end method

.method public abstract g(II)V
.end method

.method public abstract h(IJ)V
.end method

.method public abstract i(IJ)V
.end method

.method public abstract j(IZ)V
.end method

.method public abstract k(ILjava/lang/String;)V
.end method

.method public abstract l(ILxo1;)V
.end method

.method public abstract m(Lxo1;)V
.end method

.method public abstract n(I[B)V
.end method

.method public abstract o(Lqo1;)V
.end method

.method public abstract p(B)V
.end method

.method public abstract q(I)V
.end method

.method public abstract r(I)V
.end method

.method public abstract s(I)V
.end method

.method public abstract t(J)V
.end method

.method public abstract u(J)V
.end method

.method public abstract v(Ljava/lang/String;)V
.end method
