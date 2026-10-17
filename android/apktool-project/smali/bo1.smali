.class public final Lbo1;
.super Lvk;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# instance fields
.field public final c:Lao1;


# direct methods
.method public constructor <init>(Lcf2;ILao1;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lvk;-><init>(Lcf2;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lbo1;->c:Lao1;

    .line 5
    .line 6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string p2, "%"

    .line 9
    .line 10
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcf2;->d(Ljava/lang/StringBuilder;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x1

    .line 17
    invoke-virtual {p1}, Lcf2;->c()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eq p2, p1, :cond_0

    .line 22
    .line 23
    const/16 p1, 0x74

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/16 p1, 0x54

    .line 27
    .line 28
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-char p1, p3, Lao1;->j:C

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final z(Lk00;Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lbo1;->c:Lao1;

    .line 2
    .line 3
    iget-char v0, v0, Lao1;->j:C

    .line 4
    .line 5
    iget-object p0, p0, Lvk;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lcf2;

    .line 8
    .line 9
    iget-object p1, p1, Lk00;->g:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    instance-of v1, p2, Ljava/util/Date;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    instance-of v1, p2, Ljava/util/Calendar;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    instance-of v1, p2, Ljava/lang/Long;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    add-int/lit8 p0, p0, 0x2

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 39
    .line 40
    .line 41
    const-string p0, "%t"

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p1, p2, p0}, Lk00;->h(Ljava/lang/StringBuilder;Ljava/lang/Object;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    const-string v2, "%"

    .line 60
    .line 61
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v1}, Lcf2;->d(Ljava/lang/StringBuilder;)V

    .line 65
    .line 66
    .line 67
    const/4 v2, 0x1

    .line 68
    invoke-virtual {p0}, Lcf2;->c()Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    if-eq v2, p0, :cond_2

    .line 73
    .line 74
    const/16 p0, 0x74

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    const/16 p0, 0x54

    .line 78
    .line 79
    :goto_1
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    sget-object v0, Lef2;->a:Ljava/util/Locale;

    .line 90
    .line 91
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-static {v0, p0, p2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    return-void
.end method
