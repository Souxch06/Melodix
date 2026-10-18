.class public final Le12;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:Ljava/lang/String;

.field public final synthetic k:Ljava/lang/String;

.field public final synthetic l:Ljava/lang/String;

.field public final synthetic m:J

.field public final synthetic n:Lk22;


# direct methods
.method public constructor <init>(Lk22;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Le12;->j:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p3, p0, Le12;->k:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p4, p0, Le12;->l:Ljava/lang/String;

    .line 9
    .line 10
    iput-wide p5, p0, Le12;->m:J

    .line 11
    .line 12
    iput-object p1, p0, Le12;->n:Lk22;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    .line 1
    iget-object v0, p0, Le12;->n:Lk22;

    .line 2
    .line 3
    iget-object v0, v0, Lk22;->b:Lsa2;

    .line 4
    .line 5
    iget-object v1, p0, Le12;->k:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Le12;->j:Ljava/lang/String;

    .line 8
    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ls02;->l()V

    .line 16
    .line 17
    .line 18
    iget-object p0, v0, Lsa2;->P:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-nez p0, :cond_0

    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    iput-object v1, v0, Lsa2;->P:Ljava/lang/String;

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    iput-object p0, v0, Lsa2;->O:Lm52;

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    new-instance v3, Lm52;

    .line 36
    .line 37
    iget-object v4, p0, Le12;->l:Ljava/lang/String;

    .line 38
    .line 39
    iget-wide v5, p0, Le12;->m:J

    .line 40
    .line 41
    invoke-direct {v3, v4, v2, v5, v6}, Lm52;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Lsa2;->c()Ls02;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Ls02;->l()V

    .line 49
    .line 50
    .line 51
    iget-object p0, v0, Lsa2;->P:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_2

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_2
    iput-object v1, v0, Lsa2;->P:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v3, v0, Lsa2;->O:Lm52;

    .line 61
    .line 62
    return-void
.end method
