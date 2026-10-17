.class public abstract Lr11;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lpa0;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lug0;

    .line 2
    .line 3
    invoke-direct {v0}, Lug0;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lic;->a:Lic;

    .line 7
    .line 8
    const-class v2, Lr11;

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Lug0;->a(Ljava/lang/Class;Lir0;)Lz00;

    .line 11
    .line 12
    .line 13
    const-class v2, Lff;

    .line 14
    .line 15
    invoke-virtual {v0, v2, v1}, Lug0;->a(Ljava/lang/Class;Lir0;)Lz00;

    .line 16
    .line 17
    .line 18
    new-instance v1, Lpa0;

    .line 19
    .line 20
    const/16 v2, 0x10

    .line 21
    .line 22
    invoke-direct {v1, v2, v0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    sput-object v1, Lr11;->a:Lpa0;

    .line 26
    .line 27
    return-void
.end method
