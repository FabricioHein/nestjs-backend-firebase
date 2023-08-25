import { Catch, HttpException, HttpStatus} from '@nestjs/common';

export const ErroNotAceptable = (msg: string) => {
    throw new HttpException(
        {
            status: HttpStatus.NOT_ACCEPTABLE,
            error: msg,
        },
        HttpStatus.NOT_ACCEPTABLE,
    );
}