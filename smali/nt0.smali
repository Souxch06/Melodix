.class public final Lnt0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final synthetic a:I

.field public final b:[Ljava/lang/Object;

.field public c:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Lnt0;->a:I

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x100

    .line 22
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lnt0;->b:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lnt0;->a:I

    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    new-array p1, p1, [Ljava/lang/Object;

    .line 10
    .line 11
    iput-object p1, p0, Lnt0;->b:[Ljava/lang/Object;

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string p0, "The max pool size must be > 0"

    .line 15
    .line 16
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    throw p0
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lnt0;->a:I

    .line 2
    .line 3
    iget-object v1, p0, Lnt0;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    packed-switch v0, :pswitch_data_0

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lnt0;->c:I

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    add-int/lit8 v0, v0, -0x1

    .line 14
    .line 15
    aget-object v3, v1, v0

    .line 16
    .line 17
    aput-object v2, v1, v0

    .line 18
    .line 19
    iput v0, p0, Lnt0;->c:I

    .line 20
    .line 21
    move-object v2, v3

    .line 22
    :cond_0
    return-object v2

    .line 23
    :pswitch_0
    iget v0, p0, Lnt0;->c:I

    .line 24
    .line 25
    if-lez v0, :cond_1

    .line 26
    .line 27
    add-int/lit8 v0, v0, -0x1

    .line 28
    .line 29
    aget-object v3, v1, v0

    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    aput-object v2, v1, v0

    .line 35
    .line 36
    iget v0, p0, Lnt0;->c:I

    .line 37
    .line 38
    add-int/lit8 v0, v0, -0x1

    .line 39
    .line 40
    iput v0, p0, Lnt0;->c:I

    .line 41
    .line 42
    move-object v2, v3

    .line 43
    :cond_1
    return-object v2

    .line 44
    nop

    .line 45
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public b(Lga;)V
    .locals 3

    .line 1
    iget v0, p0, Lnt0;->c:I

    .line 2
    .line 3
    iget-object v1, p0, Lnt0;->b:[Ljava/lang/Object;

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-ge v0, v2, :cond_0

    .line 7
    .line 8
    aput-object p1, v1, v0

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Lnt0;->c:I

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget v0, p0, Lnt0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :goto_0
    iget-object v2, p0, Lnt0;->b:[Ljava/lang/Object;

    .line 5
    .line 6
    if-ge v1, v0, :cond_1

    .line 7
    .line 8
    aget-object v2, v2, v1

    .line 9
    .line 10
    if-eq v2, p1, :cond_0

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p0, "Already in the pool!"

    .line 16
    .line 17
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget v0, p0, Lnt0;->c:I

    .line 22
    .line 23
    array-length v1, v2

    .line 24
    if-ge v0, v1, :cond_2

    .line 25
    .line 26
    aput-object p1, v2, v0

    .line 27
    .line 28
    add-int/lit8 v0, v0, 0x1

    .line 29
    .line 30
    iput v0, p0, Lnt0;->c:I

    .line 31
    .line 32
    :cond_2
    return-void
.end method
