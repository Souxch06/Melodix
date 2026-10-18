.class public abstract Lb;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "0123456789abcdef"

    .line 2
    .line 3
    sget-object v1, Lyj;->a:Ljava/nio/charset/Charset;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    sput-object v0, Lb;->a:[B

    .line 13
    .line 14
    return-void
.end method

.method public static final a(JLeh;)Ljava/lang/String;
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    const-wide/16 v1, 0x1

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    sub-long v3, p0, v1

    .line 10
    .line 11
    invoke-virtual {p2, v3, v4}, Leh;->h(J)B

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v5, 0xd

    .line 16
    .line 17
    if-ne v0, v5, :cond_0

    .line 18
    .line 19
    sget-object p0, Lyj;->a:Ljava/nio/charset/Charset;

    .line 20
    .line 21
    invoke-virtual {p2, v3, v4, p0}, Leh;->s(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-wide/16 v0, 0x2

    .line 26
    .line 27
    invoke-virtual {p2, v0, v1}, Leh;->skip(J)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    sget-object v0, Lyj;->a:Ljava/nio/charset/Charset;

    .line 32
    .line 33
    invoke-virtual {p2, p0, p1, v0}, Leh;->s(JLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p2, v1, v2}, Leh;->skip(J)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method
