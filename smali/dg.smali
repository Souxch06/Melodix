.class public final Ldg;
.super Lfg;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final d:[C


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    new-instance v0, Lcg;

    .line 2
    .line 3
    const/16 v1, 0x10

    .line 4
    .line 5
    new-array v1, v1, [C

    .line 6
    .line 7
    fill-array-data v1, :array_0

    .line 8
    .line 9
    .line 10
    const-string v2, "base16()"

    .line 11
    .line 12
    invoke-direct {v0, v2, v1}, Lcg;-><init>(Ljava/lang/String;[C)V

    .line 13
    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-direct {p0, v0, v2}, Lfg;-><init>(Lcg;Ljava/lang/Character;)V

    .line 17
    .line 18
    .line 19
    const/16 v0, 0x200

    .line 20
    .line 21
    new-array v0, v0, [C

    .line 22
    .line 23
    iput-object v0, p0, Ldg;->d:[C

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    :goto_0
    const/16 v2, 0x100

    .line 27
    .line 28
    if-ge v0, v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Ldg;->d:[C

    .line 31
    .line 32
    ushr-int/lit8 v3, v0, 0x4

    .line 33
    .line 34
    aget-char v3, v1, v3

    .line 35
    .line 36
    aput-char v3, v2, v0

    .line 37
    .line 38
    or-int/lit16 v3, v0, 0x100

    .line 39
    .line 40
    and-int/lit8 v4, v0, 0xf

    .line 41
    .line 42
    aget-char v4, v1, v4

    .line 43
    .line 44
    aput-char v4, v2, v3

    .line 45
    .line 46
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    return-void

    .line 50
    nop

    .line 51
    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
    .end array-data
.end method


# virtual methods
.method public final c(Ljava/lang/StringBuilder;[BI)V
    .locals 4

    .line 1
    array-length v0, p2

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {v1, p3, v0}, Las;->h(III)V

    .line 4
    .line 5
    .line 6
    :goto_0
    if-ge v1, p3, :cond_0

    .line 7
    .line 8
    aget-byte v0, p2, v1

    .line 9
    .line 10
    and-int/lit16 v0, v0, 0xff

    .line 11
    .line 12
    iget-object v2, p0, Ldg;->d:[C

    .line 13
    .line 14
    aget-char v3, v2, v0

    .line 15
    .line 16
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/Appendable;

    .line 17
    .line 18
    .line 19
    or-int/lit16 v0, v0, 0x100

    .line 20
    .line 21
    aget-char v0, v2, v0

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/Appendable;

    .line 24
    .line 25
    .line 26
    add-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    return-void
.end method
