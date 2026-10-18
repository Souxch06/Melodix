.class public interface abstract Lst1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final b:Lzt1;

.field public static final c:Lpt1;

.field public static final d:Lbr1;

.field public static final e:Lbr1;

.field public static final f:Lbr1;

.field public static final g:Liq1;

.field public static final h:Liq1;

.field public static final i:Lxt1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lzt1;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lst1;->b:Lzt1;

    .line 7
    .line 8
    new-instance v0, Lpt1;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lst1;->c:Lpt1;

    .line 14
    .line 15
    new-instance v0, Lbr1;

    .line 16
    .line 17
    const-string v1, "continue"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lbr1;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lst1;->d:Lbr1;

    .line 23
    .line 24
    new-instance v0, Lbr1;

    .line 25
    .line 26
    const-string v1, "break"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lbr1;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lst1;->e:Lbr1;

    .line 32
    .line 33
    new-instance v0, Lbr1;

    .line 34
    .line 35
    const-string v1, "return"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lbr1;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lst1;->f:Lbr1;

    .line 41
    .line 42
    new-instance v0, Liq1;

    .line 43
    .line 44
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-direct {v0, v1}, Liq1;-><init>(Ljava/lang/Boolean;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lst1;->g:Liq1;

    .line 50
    .line 51
    new-instance v0, Liq1;

    .line 52
    .line 53
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-direct {v0, v1}, Liq1;-><init>(Ljava/lang/Boolean;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lst1;->h:Liq1;

    .line 59
    .line 60
    new-instance v0, Lxt1;

    .line 61
    .line 62
    const-string v1, ""

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lxt1;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lst1;->i:Lxt1;

    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public abstract c()Ljava/lang/Boolean;
.end method

.method public abstract d()Ljava/util/Iterator;
.end method

.method public abstract e()Ljava/lang/String;
.end method

.method public abstract f()Ljava/lang/Double;
.end method

.method public abstract o(Ljava/lang/String;Ler0;Ljava/util/ArrayList;)Lst1;
.end method

.method public abstract p()Lst1;
.end method
