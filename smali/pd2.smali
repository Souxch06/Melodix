.class public final Lpd2;
.super Lqd2;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final e:Lqd2;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lpd2;

    .line 2
    .line 3
    new-instance v1, Lu71;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, v2}, Lu71;-><init>(I)V

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {v0, v2, v1}, Lqd2;-><init>(Lqd2;Lu71;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lqd2;->a()Lqd2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Lpd2;->e:Lqd2;

    .line 18
    .line 19
    new-instance v1, Lpd2;

    .line 20
    .line 21
    new-instance v2, Lu71;

    .line 22
    .line 23
    invoke-direct {v2}, Lu71;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-direct {v1, v0, v2}, Lqd2;-><init>(Lqd2;Lu71;)V

    .line 27
    .line 28
    .line 29
    iget-boolean v0, v1, Lqd2;->c:Z

    .line 30
    .line 31
    xor-int/lit8 v0, v0, 0x1

    .line 32
    .line 33
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 34
    .line 35
    const-string v3, "Can\'t mutate after handing to trace"

    .line 36
    .line 37
    invoke-static {v3, v0}, Las;->i(Ljava/lang/String;Z)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Lqd2;->b()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    xor-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    const-string v3, "Key already present"

    .line 47
    .line 48
    invoke-static {v3, v0}, Las;->i(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v1, Lqd2;->b:Lu71;

    .line 52
    .line 53
    sget-object v3, Lqd2;->d:Lod2;

    .line 54
    .line 55
    invoke-virtual {v0, v3, v2}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1}, Lqd2;->a()Lqd2;

    .line 59
    .line 60
    .line 61
    return-void
.end method
