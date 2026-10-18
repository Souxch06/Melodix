.class public final Luf;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Luf;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final j:[I

.field public final k:Ljava/util/ArrayList;

.field public final l:[I

.field public final m:[I

.field public final n:I

.field public final o:Ljava/lang/String;

.field public final p:I

.field public final q:I

.field public final r:Ljava/lang/CharSequence;

.field public final s:I

.field public final t:Ljava/lang/CharSequence;

.field public final u:Ljava/util/ArrayList;

.field public final v:Ljava/util/ArrayList;

.field public final w:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lg3;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    invoke-direct {v0, v1}, Lg3;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Luf;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 172
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Luf;->j:[I

    .line 173
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Luf;->k:Ljava/util/ArrayList;

    .line 174
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Luf;->l:[I

    .line 175
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Luf;->m:[I

    .line 176
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Luf;->n:I

    .line 177
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Luf;->o:Ljava/lang/String;

    .line 178
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Luf;->p:I

    .line 179
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Luf;->q:I

    .line 180
    sget-object v0, Landroid/text/TextUtils;->CHAR_SEQUENCE_CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    iput-object v1, p0, Luf;->r:Ljava/lang/CharSequence;

    .line 181
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Luf;->s:I

    .line 182
    invoke-interface {v0, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    iput-object v0, p0, Luf;->t:Ljava/lang/CharSequence;

    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Luf;->u:Ljava/util/ArrayList;

    .line 184
    invoke-virtual {p1}, Landroid/os/Parcel;->createStringArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Luf;->v:Ljava/util/ArrayList;

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Luf;->w:Z

    return-void
.end method

.method public constructor <init>(Ltf;)V
    .locals 9

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ltf;->a:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    mul-int/lit8 v1, v0, 0x6

    .line 11
    .line 12
    new-array v1, v1, [I

    .line 13
    .line 14
    iput-object v1, p0, Luf;->j:[I

    .line 15
    .line 16
    iget-boolean v1, p1, Ltf;->g:Z

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Luf;->k:Ljava/util/ArrayList;

    .line 27
    .line 28
    new-array v1, v0, [I

    .line 29
    .line 30
    iput-object v1, p0, Luf;->l:[I

    .line 31
    .line 32
    new-array v1, v0, [I

    .line 33
    .line 34
    iput-object v1, p0, Luf;->m:[I

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    move v3, v1

    .line 38
    :goto_0
    if-ge v1, v0, :cond_1

    .line 39
    .line 40
    iget-object v4, p1, Ltf;->a:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    check-cast v4, Li80;

    .line 47
    .line 48
    iget-object v5, p0, Luf;->j:[I

    .line 49
    .line 50
    add-int/lit8 v6, v3, 0x1

    .line 51
    .line 52
    iget v7, v4, Li80;->a:I

    .line 53
    .line 54
    aput v7, v5, v3

    .line 55
    .line 56
    iget-object v5, p0, Luf;->k:Ljava/util/ArrayList;

    .line 57
    .line 58
    iget-object v7, v4, Li80;->b:Lh70;

    .line 59
    .line 60
    if-eqz v7, :cond_0

    .line 61
    .line 62
    iget-object v7, v7, Lh70;->n:Ljava/lang/String;

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_0
    move-object v7, v2

    .line 66
    :goto_1
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object v5, p0, Luf;->j:[I

    .line 70
    .line 71
    add-int/lit8 v7, v3, 0x2

    .line 72
    .line 73
    iget-boolean v8, v4, Li80;->c:Z

    .line 74
    .line 75
    aput v8, v5, v6

    .line 76
    .line 77
    add-int/lit8 v6, v3, 0x3

    .line 78
    .line 79
    iget v8, v4, Li80;->d:I

    .line 80
    .line 81
    aput v8, v5, v7

    .line 82
    .line 83
    add-int/lit8 v7, v3, 0x4

    .line 84
    .line 85
    iget v8, v4, Li80;->e:I

    .line 86
    .line 87
    aput v8, v5, v6

    .line 88
    .line 89
    add-int/lit8 v6, v3, 0x5

    .line 90
    .line 91
    iget v8, v4, Li80;->f:I

    .line 92
    .line 93
    aput v8, v5, v7

    .line 94
    .line 95
    add-int/lit8 v3, v3, 0x6

    .line 96
    .line 97
    iget v7, v4, Li80;->g:I

    .line 98
    .line 99
    aput v7, v5, v6

    .line 100
    .line 101
    iget-object v5, p0, Luf;->l:[I

    .line 102
    .line 103
    iget-object v6, v4, Li80;->h:Lwh0;

    .line 104
    .line 105
    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    .line 106
    .line 107
    .line 108
    move-result v6

    .line 109
    aput v6, v5, v1

    .line 110
    .line 111
    iget-object v5, p0, Luf;->m:[I

    .line 112
    .line 113
    iget-object v4, v4, Li80;->i:Lwh0;

    .line 114
    .line 115
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    aput v4, v5, v1

    .line 120
    .line 121
    add-int/lit8 v1, v1, 0x1

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_1
    iget v0, p1, Ltf;->f:I

    .line 125
    .line 126
    iput v0, p0, Luf;->n:I

    .line 127
    .line 128
    iget-object v0, p1, Ltf;->i:Ljava/lang/String;

    .line 129
    .line 130
    iput-object v0, p0, Luf;->o:Ljava/lang/String;

    .line 131
    .line 132
    iget v0, p1, Ltf;->s:I

    .line 133
    .line 134
    iput v0, p0, Luf;->p:I

    .line 135
    .line 136
    iget v0, p1, Ltf;->j:I

    .line 137
    .line 138
    iput v0, p0, Luf;->q:I

    .line 139
    .line 140
    iget-object v0, p1, Ltf;->k:Ljava/lang/CharSequence;

    .line 141
    .line 142
    iput-object v0, p0, Luf;->r:Ljava/lang/CharSequence;

    .line 143
    .line 144
    iget v0, p1, Ltf;->l:I

    .line 145
    .line 146
    iput v0, p0, Luf;->s:I

    .line 147
    .line 148
    iget-object v0, p1, Ltf;->m:Ljava/lang/CharSequence;

    .line 149
    .line 150
    iput-object v0, p0, Luf;->t:Ljava/lang/CharSequence;

    .line 151
    .line 152
    iget-object v0, p1, Ltf;->n:Ljava/util/ArrayList;

    .line 153
    .line 154
    iput-object v0, p0, Luf;->u:Ljava/util/ArrayList;

    .line 155
    .line 156
    iget-object v0, p1, Ltf;->o:Ljava/util/ArrayList;

    .line 157
    .line 158
    iput-object v0, p0, Luf;->v:Ljava/util/ArrayList;

    .line 159
    .line 160
    iget-boolean p1, p1, Ltf;->p:Z

    .line 161
    .line 162
    iput-boolean p1, p0, Luf;->w:Z

    .line 163
    .line 164
    return-void

    .line 165
    :cond_2
    const-string p0, "Not on back stack"

    .line 166
    .line 167
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    throw v2
.end method


# virtual methods
.method public final describeContents()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 1
    iget-object p2, p0, Luf;->j:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Luf;->k:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Luf;->l:[I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Luf;->m:[I

    .line 17
    .line 18
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 19
    .line 20
    .line 21
    iget p2, p0, Luf;->n:I

    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Luf;->o:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget p2, p0, Luf;->p:I

    .line 32
    .line 33
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 34
    .line 35
    .line 36
    iget p2, p0, Luf;->q:I

    .line 37
    .line 38
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 39
    .line 40
    .line 41
    iget-object p2, p0, Luf;->r:Ljava/lang/CharSequence;

    .line 42
    .line 43
    const/4 v0, 0x0

    .line 44
    invoke-static {p2, p1, v0}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    .line 45
    .line 46
    .line 47
    iget p2, p0, Luf;->s:I

    .line 48
    .line 49
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Luf;->t:Ljava/lang/CharSequence;

    .line 53
    .line 54
    invoke-static {p2, p1, v0}, Landroid/text/TextUtils;->writeToParcel(Ljava/lang/CharSequence;Landroid/os/Parcel;I)V

    .line 55
    .line 56
    .line 57
    iget-object p2, p0, Luf;->u:Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Luf;->v:Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 65
    .line 66
    .line 67
    iget-boolean p0, p0, Luf;->w:Z

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 70
    .line 71
    .line 72
    return-void
.end method
