.class public final Lr3;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public a:I

.field public b:I

.field public c:Ljava/lang/Object;

.field public d:I


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    if-eqz p1, :cond_8

    .line 6
    .line 7
    const-class v1, Lr3;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eq v1, v2, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    check-cast p1, Lr3;

    .line 17
    .line 18
    iget v1, p0, Lr3;->a:I

    .line 19
    .line 20
    iget v2, p1, Lr3;->a:I

    .line 21
    .line 22
    if-eq v1, v2, :cond_2

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_2
    const/16 v2, 0x8

    .line 26
    .line 27
    if-ne v1, v2, :cond_3

    .line 28
    .line 29
    iget v1, p0, Lr3;->d:I

    .line 30
    .line 31
    iget v2, p0, Lr3;->b:I

    .line 32
    .line 33
    sub-int/2addr v1, v2

    .line 34
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-ne v1, v0, :cond_3

    .line 39
    .line 40
    iget v1, p0, Lr3;->d:I

    .line 41
    .line 42
    iget v2, p1, Lr3;->b:I

    .line 43
    .line 44
    if-ne v1, v2, :cond_3

    .line 45
    .line 46
    iget v1, p0, Lr3;->b:I

    .line 47
    .line 48
    iget v2, p1, Lr3;->d:I

    .line 49
    .line 50
    if-ne v1, v2, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    iget v1, p0, Lr3;->d:I

    .line 54
    .line 55
    iget v2, p1, Lr3;->d:I

    .line 56
    .line 57
    if-eq v1, v2, :cond_4

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_4
    iget v1, p0, Lr3;->b:I

    .line 61
    .line 62
    iget v2, p1, Lr3;->b:I

    .line 63
    .line 64
    if-eq v1, v2, :cond_5

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_5
    iget-object p0, p0, Lr3;->c:Ljava/lang/Object;

    .line 68
    .line 69
    iget-object p1, p1, Lr3;->c:Ljava/lang/Object;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-nez p0, :cond_7

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_6
    if-eqz p1, :cond_7

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_7
    :goto_0
    return v0

    .line 84
    :cond_8
    :goto_1
    const/4 p0, 0x0

    .line 85
    return p0
.end method

.method public final hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lr3;->a:I

    .line 2
    .line 3
    mul-int/lit8 v0, v0, 0x1f

    .line 4
    .line 5
    iget v1, p0, Lr3;->b:I

    .line 6
    .line 7
    add-int/2addr v0, v1

    .line 8
    mul-int/lit8 v0, v0, 0x1f

    .line 9
    .line 10
    iget p0, p0, Lr3;->d:I

    .line 11
    .line 12
    add-int/2addr v0, p0

    .line 13
    return v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "["

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v1, p0, Lr3;->a:I

    .line 23
    .line 24
    const/4 v2, 0x1

    .line 25
    if-eq v1, v2, :cond_3

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    if-eq v1, v2, :cond_2

    .line 29
    .line 30
    const/4 v2, 0x4

    .line 31
    if-eq v1, v2, :cond_1

    .line 32
    .line 33
    const/16 v2, 0x8

    .line 34
    .line 35
    if-eq v1, v2, :cond_0

    .line 36
    .line 37
    const-string v1, "??"

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const-string v1, "mv"

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const-string v1, "up"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const-string v1, "rm"

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_3
    const-string v1, "add"

    .line 50
    .line 51
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, ",s:"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v1, p0, Lr3;->b:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    const-string v1, "c:"

    .line 65
    .line 66
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    iget v1, p0, Lr3;->d:I

    .line 70
    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string v1, ",p:"

    .line 75
    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lr3;->c:Ljava/lang/Object;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    const-string p0, "]"

    .line 85
    .line 86
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method
