.class public final Lzw;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public j:I

.field public k:I

.field public l:I

.field public m:Lcf0;

.field public final synthetic n:Lax;


# direct methods
.method public constructor <init>(Lax;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lzw;->n:Lax;

    .line 5
    .line 6
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lzw;->j:I

    .line 8
    .line 9
    iget-object p1, p1, Lax;->a:Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {v0, v0, p1}, Lkn1;->b(III)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Lzw;->k:I

    .line 21
    .line 22
    iput p1, p0, Lzw;->l:I

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    iget-object v0, p0, Lzw;->n:Lax;

    .line 2
    .line 3
    iget-object v1, v0, Lax;->a:Ljava/lang/CharSequence;

    .line 4
    .line 5
    iget v2, p0, Lzw;->l:I

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-gez v2, :cond_0

    .line 9
    .line 10
    iput v3, p0, Lzw;->j:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Lzw;->m:Lcf0;

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    const/4 v5, -0x1

    .line 21
    const/4 v6, 0x1

    .line 22
    if-le v2, v4, :cond_1

    .line 23
    .line 24
    new-instance v0, Lcf0;

    .line 25
    .line 26
    iget v2, p0, Lzw;->k:I

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    sub-int/2addr v1, v6

    .line 36
    invoke-direct {v0, v2, v1, v6}, Laf0;-><init>(III)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lzw;->m:Lcf0;

    .line 40
    .line 41
    iput v5, p0, Lzw;->l:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v0, v0, Lax;->b:Lf90;

    .line 45
    .line 46
    iget v2, p0, Lzw;->l:I

    .line 47
    .line 48
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-interface {v0, v1, v2}, Lf90;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lps0;

    .line 57
    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    new-instance v0, Lcf0;

    .line 61
    .line 62
    iget v2, p0, Lzw;->k:I

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    sub-int/2addr v1, v6

    .line 72
    invoke-direct {v0, v2, v1, v6}, Laf0;-><init>(III)V

    .line 73
    .line 74
    .line 75
    iput-object v0, p0, Lzw;->m:Lcf0;

    .line 76
    .line 77
    iput v5, p0, Lzw;->l:I

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    iget-object v1, v0, Lps0;->j:Ljava/lang/Object;

    .line 81
    .line 82
    check-cast v1, Ljava/lang/Number;

    .line 83
    .line 84
    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iget-object v0, v0, Lps0;->k:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v0, Ljava/lang/Number;

    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    iget v2, p0, Lzw;->k:I

    .line 97
    .line 98
    invoke-static {v2, v1}, Lkn1;->p(II)Lcf0;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v2, p0, Lzw;->m:Lcf0;

    .line 103
    .line 104
    add-int/2addr v1, v0

    .line 105
    iput v1, p0, Lzw;->k:I

    .line 106
    .line 107
    if-nez v0, :cond_3

    .line 108
    .line 109
    move v3, v6

    .line 110
    :cond_3
    add-int/2addr v1, v3

    .line 111
    iput v1, p0, Lzw;->l:I

    .line 112
    .line 113
    :goto_0
    iput v6, p0, Lzw;->j:I

    .line 114
    .line 115
    return-void
.end method

.method public final hasNext()Z
    .locals 2

    .line 1
    iget v0, p0, Lzw;->j:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lzw;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget p0, p0, Lzw;->j:I

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-ne p0, v0, :cond_1

    .line 13
    .line 14
    return v0

    .line 15
    :cond_1
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final next()Ljava/lang/Object;
    .locals 3

    .line 1
    iget v0, p0, Lzw;->j:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lzw;->a()V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget v0, p0, Lzw;->j:I

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lzw;->m:Lcf0;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    iput-object v2, p0, Lzw;->m:Lcf0;

    .line 20
    .line 21
    iput v1, p0, Lzw;->j:I

    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    new-instance p0, Ljava/util/NoSuchElementException;

    .line 25
    .line 26
    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    .line 27
    .line 28
    .line 29
    throw p0
.end method

.method public final remove()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "Operation is not supported for read-only collection"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method
