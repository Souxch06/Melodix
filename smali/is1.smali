.class public final Lis1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ly82;

.field public static final b:Ly82;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Lkr1;->c:Lmd1;

    .line 2
    .line 3
    const-string v1, "45753512"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sput-object v1, Lis1;->a:Ly82;

    .line 11
    .line 12
    const-string v1, "measurement.gbraid_campaign.stop_lgclid"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lmd1;->g(Ljava/lang/String;Z)Ly82;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sput-object v0, Lis1;->b:Ly82;

    .line 19
    .line 20
    return-void
.end method
