.class public final Lhw0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Log1;


# instance fields
.field public a:Z

.field public b:Z

.field public c:Lv20;

.field public final d:Lgw0;


# direct methods
.method public constructor <init>(Lgw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lhw0;->a:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lhw0;->b:Z

    .line 8
    .line 9
    iput-object p1, p0, Lhw0;->d:Lgw0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;)Log1;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lhw0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lhw0;->a:Z

    .line 7
    .line 8
    iget-object v0, p0, Lhw0;->c:Lv20;

    .line 9
    .line 10
    iget-boolean v1, p0, Lhw0;->b:Z

    .line 11
    .line 12
    iget-object v2, p0, Lhw0;->d:Lgw0;

    .line 13
    .line 14
    invoke-virtual {v2, v0, p1, v1}, Lgw0;->i(Lv20;Ljava/lang/Object;Z)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lb10;

    .line 19
    .line 20
    const-string p1, "Cannot encode a second value in the ValueEncoderContext"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method

.method public final c(Z)Log1;
    .locals 3

    .line 1
    iget-boolean v0, p0, Lhw0;->a:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lhw0;->a:Z

    .line 7
    .line 8
    iget-object v0, p0, Lhw0;->c:Lv20;

    .line 9
    .line 10
    iget-boolean v1, p0, Lhw0;->b:Z

    .line 11
    .line 12
    iget-object v2, p0, Lhw0;->d:Lgw0;

    .line 13
    .line 14
    invoke-virtual {v2, v0, p1, v1}, Lgw0;->c(Lv20;IZ)V

    .line 15
    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    new-instance p0, Lb10;

    .line 19
    .line 20
    const-string p1, "Cannot encode a second value in the ValueEncoderContext"

    .line 21
    .line 22
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    throw p0
.end method
